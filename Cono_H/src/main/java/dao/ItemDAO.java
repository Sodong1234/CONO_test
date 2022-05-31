package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CategoryDTO;
import vo.ImgDTO;
import vo.ItemDTO;
import vo.MemberDTO;
import vo.ShopDTO;

public class ItemDAO {
	private static ItemDAO instance = new ItemDAO();
		
		private ItemDAO() {}
	
		public static ItemDAO getInstance() {
			return instance;
		}
		Connection con;
	
		public void setConnection(Connection con) {
			this.con = con;
		}
		
		// ----------------------------------- 상품 등록 ---------------------------------------------
		public int[] insertItem(ItemDTO item, ArrayList<ImgDTO> imgList, CategoryDTO categoryDTO, String member_id) {
//			System.out.println("dao - insertItem");
			
			int[] insertCount = new int[2]; // 각각의 sql 구문 실행 성공 여부를 담기 위한 배열
											// [0] -> item 테이블 INSERT 작업 성공 여부
											// [1] -> category 테이블 INSERT 작업 성공 여부
											// img 테이블의 경우 이미지가 없는 상태로 상품을 올려도 등록 가능하므로 여부를 따지지 않음 
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				// --------------------------- item 테이블 insert 작업 ---------------------------------
				int item_idx = 1; 
				
				String sql = "SELECT COUNT(item_idx) FROM item";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					item_idx = Integer.parseInt(rs.getString(1)) + 1;
				}
				
				close(pstmt);
				
				sql = "INSERT INTO item "
					+ "VALUES (?, "
						   + "(SELECT shop_idx FROM shop WHERE member_id=?)"
						    + ",?,?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, item_idx);
				pstmt.setString(2, member_id);
				pstmt.setString(3, item.getItem_title());
				pstmt.setString(4, item.getItem_content());
				pstmt.setString(5, item.getItem_price());
				pstmt.setString(6, null);
				pstmt.setString(7, "0");
				pstmt.setString(8, "N");
				pstmt.setString(9, "N");
				pstmt.setString(10, "0");
				pstmt.setString(11, item.getItem_region());
				pstmt.setString(12, item.getItem_quantity());
				insertCount[0] = pstmt.executeUpdate();
				
				close(pstmt);
				// ---------------------------------------------------------------------------------------
				
				// ----------------------------- img 테이블 insert 작업 ----------------------------------
				sql = "INSERT INTO img VALUES (?,?,?,?)";
				
				int imgNum = 1;
				for(int i = 0; i < imgList.size(); i++) {
					ImgDTO img = imgList.get(i);
					if(img.getImg_name() == null || img.getImg_real_name() == null) {
						continue;
					}
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, imgNum);
					pstmt.setInt(2, item_idx);
					pstmt.setString(3, img.getImg_real_name());
					pstmt.setString(4, img.getImg_name());
					pstmt.executeUpdate();
					close(pstmt);
					imgNum++;
				}
				// ---------------------------------------------------------------------------------------
				
				// ---------------------- category 테이블 insert 작업 ------------------------------------
				sql = "INSERT INTO category VALUES (?,?,?,'0')";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, categoryDTO.getCategory_big());
				pstmt.setString(2, categoryDTO.getCategory_small());
				pstmt.setInt(3, item_idx);
				insertCount[1] = pstmt.executeUpdate();
				// ---------------------------------------------------------------------------------------
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - insertItem()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return insertCount;
		}
		// ------------------------------------------------------------------------------------------------
		
		// ------------------- 상품 관리 페이지 (상품 조회 - 검색 기능, 필터링 기능) ----------------------
		public ArrayList<String[]> selectItemList(String member_id, String keyword, String sell_status) {
//			System.out.println("DAO - selectItemList");
			ArrayList<String[]> itemList = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// keyword가 null인 상태 (= 검색어 입력을 하지 않은 상태)
			// null인 상태를 고려하려면 sql 구문이 6개가 나와야함
			// 경우의 수를 줄이기 위해 keyword 값이 null일 때 널스트링으로 바꿔줌
			// => 똑같은 WHERE절 구문 사용 가능 (경우의 수 6 -> 3)
			if(keyword == null) {
				keyword = "";
			}
			// 상품 관리 페이지에 처음 들어갔을 때 sell_status가 null
			// => NullPointerException 예외 발생!
			// 예외 발생을 막기 위해 sell_status가 null일 경우 "0"(전체)로 바꿔줌
			if(sell_status == null) {
				sell_status = "0";
			}
			String sql ="SELECT i.item_idx, i.item_title, i.item_price, i.item_date, i.item_status, COUNT(w.member_id), i.item_readCnt, i.item_hide "
					+ "FROM item AS i "
					+ "LEFT OUTER JOIN wish AS w "
					  + "ON i.item_idx = w.item_idx "
					+ "JOIN shop AS s "
			  		  + "ON i.shop_idx = s.shop_idx "
				   + "WHERE s.member_id = ? "
					 + "AND i.item_title LIKE ? ";
			if(sell_status.equals("0")) {	// 필터링 - 전체
				sql += "GROUP BY i.item_idx "
				     + "ORDER BY i.item_idx+0 ASC";
			} else if(sell_status.equals("1")) {	// 필터링 - 판매중
				sql += "AND i.item_status = 'N' "
			       + "GROUP BY i.item_idx "
				   + "ORDER BY i.item_idx+0 ASC";
			} else {	// 필터링 - 판매완료
				sql += "AND i.item_status = 'Y' "
				   + "GROUP BY i.item_idx "
				   + "ORDER BY i.item_idx+0 ASC";
			}
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				pstmt.setString(2, "%" + keyword + "%");
				rs = pstmt.executeQuery();
				itemList = new ArrayList<String[]>();
				while(rs.next()) {
					String[] item = new String[8];
					item[0] = rs.getString(1);
					item[1] = rs.getString(2);
					item[2] = rs.getString(3);
					item[3] = rs.getString(4);
					item[4] = rs.getString(5);
					item[5] = rs.getString(6);
					item[6] = rs.getString(7);
					item[7] = rs.getString(8);
					itemList.add(item);
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - selectItemList()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return itemList;
		}
		// ------------------------------------------------------------------------------------------------
		
		// --------------------------------------- 아이템 숨김 기능 ---------------------------------------
		public int updateItemHide(String item_hide, String item_idx) {
//			System.out.println("DAO - updateItemHide");
			int updateCount = 0;
			PreparedStatement pstmt = null;
			
			if(item_hide.equals("N")) {
				item_hide = "Y";
			} else if(item_hide.equals("Y")) {
				item_hide = "N";
			}
			
			String sql = "UPDATE item SET item_hide=? WHERE item_idx=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_hide);
				pstmt.setString(2, item_idx);
				updateCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - updateItemHide()");
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return updateCount;
		}
		// ------------------------------------------------------------------------------------------------
		
		// ------------------------------ 상품 상세 정보 조회 (상품 이미지) -------------------------------
		public ArrayList<ImgDTO> selectImgList(String item_idx) {
			System.out.println("DAO - selectImgList");
			ArrayList<ImgDTO> imgList = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT img_idx, img_real_name, img_name FROM img WHERE item_idx=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				rs = pstmt.executeQuery();
				imgList = new ArrayList<ImgDTO>();
				while(rs.next()) {
					ImgDTO img = new ImgDTO();
					img.setImg_idx(rs.getString(1));
					img.setImg_real_name(rs.getString(2));
					img.setImg_name(rs.getString(3));
					imgList.add(img);
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - selectImgList()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return imgList;
		}
		// ------------------------------------------------------------------------------------------------
		
		// ------------------------------- 상품 상세 정보 조회 (상품 정보) --------------------------------
		public String[] selectItemDetail(String item_idx) {
			System.out.println("DAO - selectItemDetail");
			String[] itemDetail = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT i.item_idx, i.item_title, i.item_content, i.item_price, i.item_date, i.item_status, COUNT(w.member_id), i.item_readCnt "
					          + ", c.category_big, c.category_small, i.item_region, i.item_hide, i.item_quantity "
					     + "FROM item AS i "
					+ "LEFT JOIN wish AS w "
					       + "ON i.item_idx = w.item_idx "
					     + "JOIN category AS c "
					       + "ON i.item_idx = c.item_idx "
					    + "WHERE i.item_idx = ?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					itemDetail = new String[13];
					itemDetail[0] = rs.getString(1); // 상품 번호
					itemDetail[1] = rs.getString(2); // 상품명
					itemDetail[2] = rs.getString(3); // 상품 소개
					itemDetail[3] = rs.getString(4); // 상품 가격
					itemDetail[4] = rs.getString(5); // 상품 등록일
					itemDetail[5] = rs.getString(6); // 상품 상태(판매중/판매완/예약중)
					itemDetail[6] = rs.getString(7); // 찜 수
					itemDetail[7] = rs.getString(8); // 조회수
					itemDetail[8] = rs.getString(9); // 카테고리 대분류
					itemDetail[9] = rs.getString(10); // 카테고리 소분류
					itemDetail[10] = rs.getString(11); // 상품 거래지역
					itemDetail[11] = rs.getString(12); // 상품 숨김 여부
					itemDetail[12] = rs.getString(13); // 상품 수량
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - selectItemDetail()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return itemDetail;
		}
		// ------------------------------------------------------------------------------------------------

		public int[] updateItem(ItemDTO item, ArrayList<ImgDTO> imgList, CategoryDTO categoryDTO, String member_id) {
			int[] updateCount = new int[2]; // 각각의 sql 구문 실행 성공 여부를 담기 위한 배열
											// [0] -> item 테이블 UPDATE 작업 성공 여부
											// [1] -> category 테이블 UPDATE 작업 성공 여부
											// img 테이블의 경우 이미지가 없는 상태로 상품 수정이 가능하므로 여부를 따지지 않음 
			
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			ResultSet rs = null;
			
			String sql = "UPDATE item SET item_title=?, item_content=?, item_price=?, item_quantity=? WHERE item_idx=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item.getItem_title());
				pstmt.setString(2, item.getItem_content());
				pstmt.setString(3, item.getItem_price());
				pstmt.setString(4, item.getItem_quantity());
				pstmt.setString(5, item.getItem_idx());
				
				updateCount[0] = pstmt.executeUpdate();
				
				close(pstmt);
				
				sql = "UPDATE category SET category_big=?, category_small=? WHERE item_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, categoryDTO.getCategory_big());
				pstmt.setString(2, categoryDTO.getCategory_small());
				pstmt.setString(3, item.getItem_idx());
				
				updateCount[1] = pstmt.executeUpdate();
				
				close(pstmt);
				
				// 원본 이미지 데이터의 총 개수
				sql = "SELECT COUNT(img_idx) FROM img WHERE item_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item.getItem_idx());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(rs.getString(1).equals("0")) {	// 원본 이미지가 없을 경우 insert 작업 수행
						int img_idx = 1;	// 인덱스를 순서대로 주기 위해 변수 선언
						sql = "INSERT INTO img VALUES (?,?,?,?)";
						for(int i = 0; i < imgList.size(); i++) {
							ImgDTO img = imgList.get(i);
							if(img.getImg_name() == null || img.getImg_real_name() == null) {	// 폼데이터에서 가져온 이미지 데이터가 없을 경우 img_idx 증가 xxx
								continue;
							}
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setInt(1, img_idx);
							pstmt2.setString(2, item.getItem_idx());
							pstmt2.setString(3, img.getImg_real_name());
							pstmt2.setString(4, img.getImg_name());
							pstmt2.executeUpdate();
							img_idx++;
						}
					// 원본 이미지가 있을 경우!!
					} else {	
						// 원본 이미지는 update 구문으로 이미지 이름을 변경해줌
						int img_idx = Integer.parseInt(rs.getString(1)); 
						int imgNum = 1;
						sql = "UPDATE img SET img_real_name=?, img_name=? WHERE item_idx=? AND img_idx=?";
						for(int i = 0; i < img_idx; i++) {
							ImgDTO img = imgList.get(i);
							System.out.println(imgNum + " : " + img.getImg_real_name() + ", " + img.getImg_name());
							if(img.getImg_name() == null || img.getImg_real_name() == null) {
								continue;
							}
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setString(1, img.getImg_real_name());
							pstmt2.setString(2, img.getImg_name());
							pstmt2.setString(3, item.getItem_idx());
							pstmt2.setInt(4, imgNum);
							pstmt2.executeUpdate();
							imgNum++;
						}
						
						close(pstmt2);
						
						// 원본 이미지 개수보다 더 많이 업로드 되는 경우 
						// 원본 이미지 개수 이상의 이미지는 insert 작업 수행
						int imgNum2 = img_idx + 1;
						sql = "INSERT INTO img VALUES (?,?,?,?)";
						for(int i = imgNum2; i < imgList.size(); i++) {
							ImgDTO img = imgList.get(i);
							System.out.println(imgNum2 + " : " + img.getImg_real_name() + ", " + img.getImg_name() + "  insert구문");
							if(img.getImg_name() == null || img.getImg_real_name() == null) {
								continue;
							}
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setInt(1, imgNum2);
							pstmt2.setString(2, item.getItem_idx());
							pstmt2.setString(3, img.getImg_real_name());
							pstmt2.setString(4, img.getImg_name());
							pstmt2.executeUpdate();
							(imgNum2)++;
						}
						
//						for(int i = img_idx; i < imgList.size(); i++) {
//							ImgDTO img = imgList.get(i);
//							pstmt2.setString(1, img.getImg_real_name());
//							pstmt2.setString(2, img.getImg_name());
//							pstmt2.setString(3, item.getItem_idx());
//							pstmt2.setInt(4, img_idx);
//						}
						
					}
				}
				
//				sql = "DELETE FROM img WHERE item_idx=?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, item.getItem_idx());
//				
//				pstmt.executeUpdate();
//				
//				close(pstmt);
//				
//				sql = "INSERT INTO img VALUES (?,?,(SELECT shop_name FROM shop WHERE member_id=?),?,?)";
//				
//				int imgNum = 1;
//				for(int i = 0; i < imgList.size(); i++) {
//					ImgDTO img = imgList.get(i);
//					if(img.getImg_name() == null || img.getImg_real_name() == null) {
//						continue;
//					}
//					pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, imgNum);
//					pstmt.setString(2, item.getItem_idx());
//					pstmt.setString(3, member_id);
//					pstmt.setString(4, img.getImg_real_name());
//					pstmt.setString(5, img.getImg_name());
//					pstmt.executeUpdate();
//					close(pstmt);
//					imgNum++;
//				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - updateItem()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt2);
				close(pstmt);
			}
			
			
//			return null;
			return updateCount;
		}

		public ArrayList<String> selectImgNames(String item_idx) {
			
			ArrayList<String> imgNames = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT img_name FROM img WHERE item_idx=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				rs = pstmt.executeQuery();
				
				imgNames = new ArrayList<String>();
				
				while(rs.next()) {
					imgNames.add(rs.getString(1));
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - selectImgNames()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return imgNames;
		}

		public int[] deleteItem(String item_idx) {
			
			int[] deleteCount = new int[6];
			PreparedStatement pstmt = null;
			
			String sql = "DELETE FROM item WHERE item_idx=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				deleteCount[0] = pstmt.executeUpdate();
				
				close(pstmt);
				
				sql = "DELETE FROM img WHERE item_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				deleteCount[1] = pstmt.executeUpdate();
				
				close(pstmt);
				
				sql= "DELETE FROM review WHERE item_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				deleteCount[2] = pstmt.executeUpdate();
				
				close(pstmt);
				
				sql= "DELETE FROM wish WHERE item_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				deleteCount[3] = pstmt.executeUpdate();
				
				close(pstmt);
				
				sql= "DELETE FROM basket WHERE item_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				deleteCount[4] = pstmt.executeUpdate();
				
				close(pstmt);
				
				sql= "DELETE FROM category WHERE item_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_idx);
				
				deleteCount[5] = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생 - selectImgNames()");
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
			return deleteCount;
		}
		
		
		//--------------------------------- 현진 0530 시작-------------
		
		// 내 상점 조회
		
		public ShopDTO selectMyShop(String member_id) {
			System.out.println("selectMyShop");
			ShopDTO myShop = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM shop WHERE member_id=?";
//			
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
					myShop = new ShopDTO();
					myShop.setShop_idx(rs.getString("shop_idx"));
					myShop.setMember_id(member_id);
					myShop.setShop_name(rs.getString("shop_name"));
					myShop.setShop_img(rs.getString("shop_img"));
					myShop.setShop_content(rs.getString("shop_content"));
					myShop.setShop_level(rs.getString("shop_level"));
					
//					System.out.println(article);
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생! - selectArticle()");
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			
			return myShop;
		}

		
		// 내 상점 수정 시 비밀번호 일치 여부 판별 
		public boolean isShopWriter(String member_id, String member_pass) {
			boolean isShopWriter = false;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				
				String sql = "SELECT * FROM member WHERE member_id=? AND member_pass=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				pstmt.setString(2, member_pass);
				
				rs = pstmt.executeQuery();
			
				if(rs.next()) {
					isShopWriter = true;
				}
		    } catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생! - isShopWriter");
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return isShopWriter;
		}

		// 내 상점 수정
		public int updateShop(ShopDTO myShop, MemberDTO member) {
			int updateCount = 0;
			
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE shop "
						+ "SET member_id=?, shop_name=?, shop_content=?,shop_img=? "
						+ "WHERE shop_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, myShop.getMember_id());
				pstmt.setString(2, myShop.getShop_name());
				pstmt.setString(3, myShop.getShop_content());
				pstmt.setString(4, myShop.getShop_img());
				pstmt.setString(5, myShop.getShop_idx());
				
				updateCount = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생! - updateShop()");
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}
		
		

		// 내 상점 판매횟수, 상품갯수 조회
		public String[] selectShopCountInfo(String member_id) {
			
			String[] selectShopCountInfo = new String[2];
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {				
				
				// 판매횟수 조회
				String sql = "SELECT COUNT(*) sellCount "
						+ "FROM item it, shop s "
						+ "WHERE s.member_id = ? AND item_status = 'Y'";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member_id);
				
				rs = pstmt.executeQuery();
				
				
								
				if(rs.next()) {
					selectShopCountInfo[0] = rs.getString("sellCount");
				}
				close(rs);
				close(pstmt);
				
				// 상품갯수 조회 
				sql = "SELECT COUNT(*) itemCount "
					+ "FROM item it, shop s "
					+ "WHERE s.member_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					selectShopCountInfo[1] = rs.getString("itemCount");
					
				}
				
				
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류 발생! - selectShopCountInfo");
				e.printStackTrace();
			}finally {
				// DB 자원 반환(주의! Connection 객체 반환 금지!)
				close(rs);
				close(pstmt);
			}
			
			
			return selectShopCountInfo;
		}
		
		//--------------------------------- 현진 0530 끝-------------
}
