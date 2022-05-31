package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CoinDTO;

import static db.JdbcUtil.*;

public class MypageDAO {
	private static MypageDAO instance = new MypageDAO();
	private MypageDAO() {}
	public static MypageDAO getInstance() {
		return instance;
	};
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

//----------------------- coupon
	// 현재 보유 쿠폰
	public ArrayList<ArrayList<String>> selectCouponList(String sId) {
		System.out.println("DAO - selectCouponList");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT coupon_name, coupon_price "
					+ "FROM coupon c "
					+ "WHERE c.member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("coupon_name"));
				article.add(rs.getString("coupon_price"));
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 구문오류 - selectFollowerList");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	// 장바구니 리스트
	public ArrayList<ArrayList<String>> selectBasketItem(String sId) {
		System.out.println("DAO - selectBasketItem");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// item_idx 로 장바구니에 담길 정보 저장
			String sql = "SELECT it.item_idx, im.img_real_name, it.item_title, it.item_price "
					+ "FROM item it, img im "
					+ "WHERE it.item_idx IN (SELECT item_idx "
					+ "					   FROM basket "
					+ "					   WHERE member_id = ?) "
					+ "AND im.img_idx = '1' "
					+ "AND im.item_idx = it.item_idx ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("it.item_idx"));
				article.add(rs.getString("im.img_real_name"));
				article.add(rs.getString("it.item_title"));
				article.add(rs.getString("it.item_price"));
				
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 구문오류 - selectBasketItem");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	// 장바구니 리스트에서 아이템 제거
	public int deleteBasketItem(String item_idx) {
		System.out.println("DAO - selectBasketItem");
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM basket "
					+ "WHERE item_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_idx);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문오류 - deleteBasketItem");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("딜리트 : " + deleteCount);
		return deleteCount;
	}
	
	
	// coin 충전 & 사용 내역 표시
	public ArrayList<CoinDTO> coinHistory (String member_id){
		System.out.println("coinHistory");
		ArrayList<CoinDTO> articleList = new ArrayList<CoinDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT coin_add, coin_use, coin_total, coin_date "
					+ "FROM coin "
					+ "WHERE member_id = ? "
					+ "ORDER BY coin_idx DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CoinDTO article = new CoinDTO();
				article.setCoin_add(rs.getString("coin_add"));
				article.setCoin_use(rs.getString("coin_use"));
				article.setCoin_total(rs.getString("coin_total"));
				article.setCoin_date(rs.getString("coin_date"));
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 구문오류 - coinHistory");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return articleList;
	}
	// 코인 잔액 표시
	public String coinBalance(String member_id) {
		System.out.println("coinBalance");
		String coinBalance = "";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT co.member_id, co.coin_total "
					+ "FROM coin co "
					+ "WHERE member_id = ? "
					+ "ORDER BY co.coin_idx DESC "
					+ "LIMIT 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				coinBalance = rs.getString("co.coin_total");
			}
		} catch (SQLException e) {
			System.out.println("sql 구문오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return coinBalance;
	}
	
	// 예약중인 상품 - 예약 취소시 해야할거 : UPDATE item_status / DELETE reserved

	public ArrayList<ArrayList<String>> reservedItemList(String sId) {
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		System.out.println("reservedItemList");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT it.item_idx, im.img_real_name, it.item_title, s.shop_name, it.item_price, it.item_region "
					+ "FROM item it LEFT OUTER JOIN img im ON it.item_idx = im.item_idx, shop s, reserved re "
					+ "WHERE re.member_id = ? AND it.item_status = 'R' AND it.item_idx = re.item_idx AND im.item_idx = it.item_idx AND im.img_idx = '1' AND it.shop_idx = s.shop_idx";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("it.item_idx"));
				article.add(rs.getString("im.img_real_name"));
				article.add(rs.getString("it.item_title"));
				article.add(rs.getString("s.shop_name"));
				article.add(rs.getString("it.item_price"));
				article.add(rs.getString("it.iteitem_region"));
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("sql 구문오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	// 구매 완료된 상품 조회
	public ArrayList<ArrayList<String>> perchasedItemList(String sId) {
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		System.out.println("reservedItemList");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT it.item_idx, im.img_real_name, it.item_title, s.shop_name, it.item_price, it.item_region, it.item_endDate "
					+ "FROM item it LEFT OUTER JOIN img im ON it.item_idx = im.item_idx, shop s, reserved re "
					+ "WHERE re.member_id = ? AND it.item_status = 'Y' AND it.item_idx = re.item_idx AND im.item_idx = it.item_idx AND im.img_idx = '1' AND it.shop_idx = s.shop_idx" ;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("it.item_idx"));
				article.add(rs.getString("im.img_real_name"));
				article.add(rs.getString("it.item_title"));
				article.add(rs.getString("s.shop_name"));
				article.add(rs.getString("it.item_price"));
				article.add(rs.getString("it.item_region"));
				article.add(rs.getString("it.item_endDate"));
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("sql 구문오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
//------------------------- 최근 조회 상품 - 가준--------------------
	// 상품 클릭시 recentView 테이블에 인설트 / 조회 했을 때 동일한 member_id 와 item_idx 가 있으면 update 해주기 
	public int insertRecentViewList(String sId, String item_idx) {
		int insertCount = 0;
		
		return insertCount;
	}
	// 최근 조회 상품 리스트 - 
	public ArrayList<ArrayList<String>> recentViewList(String sId) {
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		System.out.println("reservedItemList");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT it.item_idx, im.img_real_name, it.item_title, s.shop_name, it.item_price, it.item_region , it.item_date "
					+ "FROM item it, recentView re, img im, shop s "
					+ "WHERE re.member_id =? AND it.item_idx IN (re.item_idx) AND it.item_idx = im.item_idx AND im.img_idx = '1' AND s.shop_idx = it.shop_idx "
					+ "ORDER BY re.viewTime DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("it.item_idx"));
				article.add(rs.getString("im.img_real_name"));
				article.add(rs.getString("it.item_title"));
				article.add(rs.getString("s.shop_name"));
				article.add(rs.getString("it.item_price"));
				article.add(rs.getString("it.item_region"));
				article.add(rs.getString("it.item_date"));
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("sql 구문오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	

}
