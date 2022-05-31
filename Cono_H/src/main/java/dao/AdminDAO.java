package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.AdminNoticeDTO;
import vo.AdminQNADTO;
import vo.MemberDTO;

public class AdminDAO {

	private static AdminDAO instance = new AdminDAO();

	public static AdminDAO getInstance() {
		return instance;
	}

//----------------------- 도은 시작 -------------------------------------------------
	// ---------------------------------------------------------------------------------------
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 관리하기 위해
	// Connection 타입 멤버 변수와 Setter 메서드 정의
	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}
	// ---------------------------------------------------------------------------------------

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// --------------------------------------------------------------------------------------
	
	// 전체 회원 정보
		public ArrayList<MemberDTO> selectAllMember(int pageNum, int listLimit) {
			ArrayList<MemberDTO> memberList = null;

			int startRow = (pageNum - 1) * listLimit;

			try {
				String sql = "SELECT * FROM member ORDER BY member_date DESC LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, listLimit);

				rs = pstmt.executeQuery();

				// 전체 게시물을 저장하는 객체 생성
				memberList = new ArrayList<MemberDTO>();

				while (rs.next()) {
					MemberDTO member = new MemberDTO();
					member.setMember_id(rs.getString("member_id"));
					member.setMember_nick(rs.getString("member_nick"));
					member.setMember_email(rs.getString("member_email"));
					member.setMember_phone(rs.getString("member_phone"));
					member.setMember_birth(rs.getString("member_birth"));
					member.setMember_date(rs.getString("member_date"));
					member.setMember_status(rs.getString("member_status"));

					memberList.add(member);
					System.out.println(memberList.toString());
				}

			} catch (SQLException e) {
				System.out.println("SQL 구문오류 - selectAllMember");
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}

			return memberList;
		}
	
	// 총 회원 수 조회
	public int selectListCount() {
		int listCount = 0;

		try {
			String sql = "SELECT COUNT(*) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - selectListCount()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return listCount;
	}

	
	// 관리자 공지사항 게시물 수를 조회 하는 메서드
	public int selectNoticeListCount() {
		System.out.println("AdminDAO - selectListCount()");

		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectListCount()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return listCount;
	}

	// ------------------------------------------------------------------------------
	// 관리자 공지사항 목록 조회
	public ArrayList<AdminNoticeDTO> selectNoticeList(int pageNum, int listLimit) {
		ArrayList<AdminNoticeDTO> noticeList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int startRow = (pageNum - 1) * listLimit;

		try {
			String sql = "SELECT * FROM notice  ORDER BY notice_idx+0 DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);

			rs = pstmt.executeQuery();

			noticeList = new ArrayList<AdminNoticeDTO>();

			while (rs.next()) {
				AdminNoticeDTO notice = new AdminNoticeDTO();
				notice.setNotice_idx(rs.getString("notice_idx"));
				notice.setAdmin_id(rs.getString("admin_id"));
				notice.setNotice_subject(rs.getString("notice_subject"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getString("notice_date"));

				noticeList.add(notice);
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectNoticeList()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return noticeList;
	}

	// ---------------------------------------------------------------
	// 관리자 공지사항 글쓰기

	public int insertArticle(AdminNoticeDTO adminNoticeDTO) {
		System.out.println("AdminDAO - insertArticle()");

		int insertCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = 1; // 새 글 번호를 저장할 변수

		try {
			String sql = "SELECT COUNT(notice_idx) FROM notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next() && rs.getString(1) != null) {
				System.out.println(rs.getString(1));
				num = Integer.parseInt(rs.getString(1)) + 1;
			}

			close(pstmt);

			sql = "INSERT INTO notice VALUES (?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, adminNoticeDTO.getAdmin_id());
			pstmt.setString(3, adminNoticeDTO.getNotice_subject());
			pstmt.setString(4, adminNoticeDTO.getNotice_content());
			pstmt.setString(5, adminNoticeDTO.getNotice_date());

			insertCount = pstmt.executeUpdate();

			commit(con);

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insertArticle()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return insertCount;
	}

	// ------------------------------------------------------------------------------
	// 관리자 공지사항 상세페이지 조회
	public AdminNoticeDTO selectArticle(String notice_idx) {
		AdminNoticeDTO adminNoticeDTO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();

			String sql = "SELECT * FROM notice WHERE notice_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice_idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				adminNoticeDTO = new AdminNoticeDTO();
				adminNoticeDTO.setNotice_idx(rs.getString("notice_idx"));
				adminNoticeDTO.setAdmin_id(rs.getString("admin_id"));
				adminNoticeDTO.setNotice_subject(rs.getString("notice_subject"));
				adminNoticeDTO.setNotice_content(rs.getString("notice_content"));
				adminNoticeDTO.setNotice_date(rs.getString("notice_date"));

			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - selectArticle()");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return adminNoticeDTO;
	}

	// --------------------------------------------------------
	// 관리자 공지사항 삭제
	public int deleteArticle(String notice_idx) {
		System.out.println("deleteArticle");
		System.out.println(notice_idx);
		int deleteCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "DELETE FROM notice WHERE notice_idx=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice_idx);
			deleteCount = pstmt.executeUpdate();
			System.out.println("deleteCount" + deleteCount);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - deleteArticle()");
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

	// ---------------------------------------------------
	// 관리자 공지사항 수정
	public int modifyNotice(AdminNoticeDTO notice) {
		int modifyCount = 0;

		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE notice SET admin_id=?,notice_subject=?,notice_content=? WHERE notice_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice.getAdmin_id());
			pstmt.setString(2, notice.getNotice_subject());
			pstmt.setString(3, notice.getNotice_content());
			pstmt.setString(4, notice.getNotice_idx());

			modifyCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - updateArticle()");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return modifyCount;
	}

	// ------------------------------------------------------------
	// 관리자 공지사항 검색

	public ArrayList<AdminNoticeDTO> searchNoticeList(String search, String searchType, String notice_idx) {
		ArrayList<AdminNoticeDTO> noticeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			String sql = "SELECT * FROM notice WHERE";
			if (searchType.equals("subject")) { // 제목으로 검색
				sql += " notice_subject ";
			} else if (searchType.equals("name")) { // 작성자
				sql += " admin_id ";
			}
			sql += "LIKE ? ORDER BY notice_idx+0 DESC";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			noticeList = new ArrayList<AdminNoticeDTO>();
			while (rs.next()) {

				AdminNoticeDTO notice = new AdminNoticeDTO();
				notice.setNotice_idx(rs.getString("notice_idx"));
				notice.setAdmin_id(rs.getString("admin_id"));
				notice.setNotice_subject(rs.getString("notice_subject"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getString("notice_date"));

				noticeList.add(notice);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - searchNoticeList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return noticeList;

	}

	// -------------------------------------------------------------
	// 관리자 qna 목록 갯수
	public int selectQNAListCount() {
		System.out.println("AdminDAO - selectQNAListCount()");

		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectQNAListCount()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return listCount;
	}

	// -------------------------------------------------------------
	// 관리자 qna 리스트 조회
	public ArrayList<AdminQNADTO> selectQNAList(int pageNum, int listLimit) {
		ArrayList<AdminQNADTO> qnaList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int startRow = (pageNum - 1) * listLimit;

		try {
			String sql = "SELECT * FROM qna ORDER BY qna_idx+0 DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);

			rs = pstmt.executeQuery();

			qnaList = new ArrayList<AdminQNADTO>();

			while (rs.next()) {
				AdminQNADTO qna = new AdminQNADTO();
				qna.setQna_idx(rs.getString("qna_idx"));
				qna.setMember_id(rs.getString("member_id"));
				qna.setQna_type(rs.getString("qna_type"));
				qna.setQna_subject(rs.getString("qna_subject"));
				qna.setQna_content(rs.getString("qna_content"));
				qna.setQna_re_ref(rs.getInt("qna_re_ref"));
				qna.setQna_re_lev(rs.getInt("qna_re_lev"));
				qna.setQna_re_seq(rs.getInt("qna_re_seq"));
				qna.setQna_date(rs.getString("qna_date"));

				qnaList.add(qna);
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectNoticeList()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return qnaList;
	}

	// -----------------------------------------------------------------
	// 관리자 qna 글쓰기

	public int insertArticle(AdminQNADTO adminQNADTO, String sId) {
		System.out.println("AdminDAO - insertArticle()");

		int insertCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = 1; // 새 글 번호를 저장할 변수

		try {
			String sql = "SELECT COUNT(qna_idx) FROM qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next() && rs.getString(1) != null) {
				System.out.println(rs.getString(1));
				num = Integer.parseInt(rs.getString(1)) + 1;
			}

			close(pstmt);

			sql = "INSERT INTO qna VALUES (?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); // 새 글 번호
			pstmt.setString(2, sId);
			pstmt.setString(3, adminQNADTO.getQna_type());
			pstmt.setString(4, adminQNADTO.getQna_subject());
			pstmt.setString(5, adminQNADTO.getQna_content());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setString(9, adminQNADTO.getQna_date());
			pstmt.setString(10, "답변대기");

//				select case when age = '20' then '답변전' else '답변완료' end as age
			insertCount = pstmt.executeUpdate();

			commit(con);

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insertArticle()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return insertCount;
	}

	// ------------------------------------------------------------------------------
	// 관리자 qna 상세페이지 조회
	public AdminQNADTO selectQNAArticle(String qna_idx, String sId) {
		AdminQNADTO adminQNADTO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();

			String sql = "SELECT * FROM qna WHERE qna_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna_idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				adminQNADTO = new AdminQNADTO();
				adminQNADTO.setQna_idx(rs.getString("qna_idx"));
				adminQNADTO.setQna_type(rs.getString("qna_type"));
				adminQNADTO.setQna_subject(rs.getString("qna_subject"));
				adminQNADTO.setMember_id(rs.getString("member_id"));
				adminQNADTO.setQna_content(rs.getString("qna_content"));
				adminQNADTO.setQna_date(rs.getString("qna_date"));
				adminQNADTO.setQna_re_ref(rs.getInt("qna_re_ref"));
				adminQNADTO.setQna_re_lev(rs.getInt("qna_re_lev"));
				adminQNADTO.setQna_re_seq(rs.getInt("qna_re_seq"));

			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - selectQNAArticle()");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return adminQNADTO;
	}

	// --------------------------------------------------------
	// 관리자 qna 삭제
	public int deleteQNAArticle(String qna_idx) {
		System.out.println("deleteQNAArticle");
		int deleteCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "DELETE FROM qna WHERE qna_idx=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna_idx);
			deleteCount = pstmt.executeUpdate();
			System.out.println("deleteCount" + deleteCount);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - deleteArticle()");
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

	// ---------------------------------------------------
	// 관리자 qna 수정
	public int modifyQNA(AdminQNADTO qna) {
		System.out.println("modifyQNA - dao");
		int modifyCount = 0;
		System.out.println(qna.getQna_idx());
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE qna SET qna_type=?,qna_subject=?,qna_content=? WHERE qna_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getQna_type());
			pstmt.setString(2, qna.getQna_subject());
			pstmt.setString(3, qna.getQna_content());
			pstmt.setString(4, qna.getQna_idx());

			modifyCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - modifyQNA()");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return modifyCount;
	}

	// ---------------------------------------------------
	// 관리자 qna 검색
	public ArrayList<AdminQNADTO> searchQNAList(String search, String searchType) {
		ArrayList<AdminQNADTO> qnaList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			String sql = "SELECT * FROM qna WHERE";
			if (searchType.equals("subject")) { // 제목으로 검색
				sql += " qna_subject ";
			} else if (searchType.equals("name")) { // 작성자
				sql += " member_id ";
			}
			sql += "LIKE ? ORDER BY qna_idx+0 DESC";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			qnaList = new ArrayList<AdminQNADTO>();
			while (rs.next()) {

				AdminQNADTO qna = new AdminQNADTO();
				qna.setQna_idx(rs.getString("qna_idx"));
				qna.setMember_id(rs.getString("member_id"));
				qna.setQna_subject(rs.getString("qna_subject"));
				qna.setQna_content(rs.getString("qna_content"));
				qna.setQna_date(rs.getString("qna_date"));

				qnaList.add(qna);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - searchNoticeList()");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return qnaList;
	}
	// ---------------------------------------------------
	// 관리자 qna 답글

	public int insertReplyArticle(AdminQNADTO qna) {
		System.out.println("insertReplyArticle - dao");
		int insertCount = 0;

		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;

		int num = 1;

		try {
			String sql = "SELECT MAX(qna_idx) FROM qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			sql = "UPDATE qna SET qna_re_seq=qna_re_seq+1 " + "WHERE qna_re_ref=? AND qna_re_seq>?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, qna.getQna_re_ref()); // 참조글번호
			pstmt2.setInt(2, qna.getQna_re_seq()); // 순서번호
			pstmt2.executeUpdate();
			pstmt2.close();			
			sql = "INSERT INTO qna VALUES (?,?,?,?,?,?,?,?,?,?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, num); // 새 글 번호
			pstmt2.setString(2, qna.getMember_id());
			pstmt2.setString(3, ""); // qna_type
			pstmt2.setString(4, qna.getQna_subject());
			pstmt2.setString(5, qna.getQna_content());
			// -----------------------------------------------------------------------------
			pstmt2.setInt(6, qna.getQna_re_ref());
			pstmt2.setInt(7, qna.getQna_re_lev() + 1);
			pstmt2.setInt(8, qna.getQna_re_seq() + 1);
			pstmt2.setString(9, qna.getQna_date()); // qna_date
			
			sql = "UPDATE qna SET qna_status='답변완료' WHERE qna_re_lev>0";
			pstmt2.setString(10, qna.getQna_status()); // qna_stauts
			// -----------------------------------------------------------------------------

			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insertReplyArticle()");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
		}

		return insertCount;

	}
	//--------------------------------------- 도은 끝 ---------------------------------
	
	// =================================================================================================================


//----------------------------------------- 혜은 시작 -----------------------------
	
	// MemberList
	// 전체 회원 정보
		public ArrayList<String[]> selectAllMember(int pageNum, int listLimit, String searchType, String search) {
			ArrayList<String[]> memberList = null;
			
			int startRow =(pageNum -  1)  * listLimit;
			
			try {
				if(searchType == null) {
					String sql = "SELECT m.member_id, s.shop_idx, c.coin_total,  m.member_nick, m.member_email, m.member_phone, m.member_birth, m.member_date, m.member_status "
							+ "FROM member m left outer JOIN shop s "
							+ "ON m.member_id = s.member_id "
							+ "left outer JOIN coin c "
							+ "ON s.member_id = c.member_id "
							+ "ORDER BY m.member_date DESC LIMIT ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, listLimit);
					
					rs = pstmt.executeQuery();
					
				} else {
					String sql = "SELECT m.member_id, s.shop_idx, c.coin_total,  m.member_nick, m.member_email, m.member_phone, m.member_birth, m.member_date, m.member_status "
								+ "FROM member m left outer JOIN shop s "
								+ "ON m.member_id = s.member_id "
								+ "left outer JOIN coin c "
								+ "ON s.member_id = c.member_id "
								+ "WHERE " + searchType + " LIKE ?"
								+ "ORDER BY m.member_date DESC LIMIT ?,?";
				
//						 "SELECT member_id, shop_idx, coin_total, member_nick, member_email, member_phone, member_birth, member_date, member_status "
//						+ "FROM member NATURAL JOIN shop NATURAL JOIN coin "
//						+ "WHERE " + searchType + " LIKE ?"
//						+ "ORDER BY member_date DESC LIMIT ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + search + "%");
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, listLimit);
					
					rs = pstmt.executeQuery();
				}
				
				// 전체 게시물을 저장하는 객체 생성
				memberList = new ArrayList<String[]>();
				
				
				while(rs.next()) {
					String[] member = new String[9];
					member[0] = (rs.getString("member_id"));
					member[1] = (rs.getString("member_nick"));
					member[2] = (rs.getString("shop_idx"));
					member[3] = (rs.getString("coin_total"));
					member[4] = (rs.getString("member_phone"));
					member[5] = (rs.getString("member_email"));
					member[6] = (rs.getString("member_date"));
					member[7] = (rs.getString("member_status"));
					
					memberList.add(member);
				}
				
			} catch (SQLException e) {
				System.out.println("SQL 구문오류 - selectAllMember");
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			
			return memberList;
		}
	
	
	// 총 회원 수 조회
	public int selectMemberListCount() {
		int listCount = 0;
		
		try {
			String sql = "SELECT COUNT(*) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - selectMemberListCount()");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}
	
	 // 상품 '거래중' 리스트 조회
	   public ArrayList<String[]> selectAllDeal(int pageNum, int listLimit) {
	      ArrayList<String[]> dealList = null;
	      
	      try {
	         String sql = "SELECT item_title, item_idx, shop_id, member_id, coin_use, order_date, safe_status "
	         		+ "FROM ord NATURAL JOIN safe ";
//	         		+ "WHERE safe_status=N";
	         
	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         dealList = new ArrayList<String[]>();
	         
	         while(rs.next()) {
	            String[] product = new String[7];
	            product[0] = rs.getString("item_title");
	            product[1] = rs.getString("item_idx");
	            product[2] = rs.getString("shop_id");
	            product[3] = rs.getString("member_id");
	            product[4] = rs.getString("coin_use");
	            product[5] = rs.getString("order_date");
	            product[6] = rs.getString("safe_status");
	            
	            dealList.add(product);
	         }
	         
	      } catch (SQLException e) {
	         System.out.println("SQL 구문 오류 - selectAllDeal()");
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return dealList;
	   }

	   // 거래중 리스트 갯수 조회
	   public int selectDealListCount() {
		   int listCount = 0;
		   
		   try {
			   String sql = "SELECT COUNT(*) FROM ord";
			   pstmt = con.prepareStatement(sql);
			   rs = pstmt.executeQuery();

			   if(rs.next()) {
				   listCount = rs.getInt(1);
			   }
			   
		   } catch (SQLException e) {
			   System.out.println("SQL 구문 오류 - selectDealListCount()");
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
			   close(rs);
		   }
		   
		   return listCount;
	   }
	   
	   
	// '거래 취소' 시 거래상태 수정('거래중'N / '거래완료'Y / '거래취소'C)
	public int dealCancel(String item_idx, String coin_use, String safe_status) {
		int dealCancel = 0;
		
		try {
			String sql = "UPDATE safe "
					+ "SET safe_status = 'C' "
					+ "WHERE item_idx = ?";
//			UPDATE safe SET safe_status='N' WHERE item_idx='1';  // 이게 필요할까? => ( AND member_id ='hong')
			
			sql = "DELETE FROM safe WHERE item_idx=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, safe_status);
			pstmt.setString(2, item_idx);
			
			dealCancel = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문오류 - dealCancel()");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return dealCancel;
	}
	
//----------------------------------------- 혜은 끝 ---------------------------------
	
	
	
	
	
	// 회원 탈퇴 본인/관리자 판별
	public boolean isExitMember(String member_id) {
		boolean isExitMember = false;

		try {
			String sql = "SELECT * FROM member WHERE member_id=? OR member_id=admin";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isExitMember = true;
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - isExitMember()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return isExitMember;
	}

	// 회원 탈퇴 수행
	public int exitMember(String member_id) {
		int exitCount = 0;

		try {
			String sql = "DELETE FROM member WHERE member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);

			exitCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return exitCount;
	}

}
