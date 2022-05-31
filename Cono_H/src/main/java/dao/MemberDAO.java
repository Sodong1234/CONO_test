package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

import static db.JdbcUtil.*;
import vo.MemberDTO;

// 일반회원가입
public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {}

	public static MemberDAO getInstance() {
		return instance;
	}
	// ---------------------------------------------------
	// 외부에서 Connection 객체를 전달받아 멤버변수에 저장
	private Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}
	public int insertMember(MemberDTO member) {
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?, null, null, null)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pass());
			pstmt.setString(5, member.getMember_nick());
			pstmt.setString(3, member.getMember_email());
			pstmt.setString(6, member.getMember_birth());
			pstmt.setString(4, member.getMember_phone());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertMember()");
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	public boolean isMember(MemberDTO member) {
		boolean isMember = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM member WHERE member_id=? AND member_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pass());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isMember = true;
			}
		} catch (SQLException e) {
			System.out.println("isMember() 메서드 오류!");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isMember;
	}
	
	// 회원 정보 삭제
		public int deleteMember(MemberDTO member) {
			int deleteCount = 0;
			
			PreparedStatement pstmt = null;
			
			try {
				String sql = "DELETE FROM member WHERE member_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getMember_id());
				
				deleteCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("구문 오류! - deleteMember();");
			} finally {
				JdbcUtil.close(pstmt);
			}
			
			return deleteCount;
		}

//		// 회원 정보 조회
//		public MemberDTO selectMemberInfo(String id) {
//			MemberDTO member = null;
//			
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			try {
//				
//				String sql = "SELECT * FROM member WHERE id=?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, id);
//				
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					member = new MemberDTO();
//					member.setMember_id("id");
//					member.setMember_pass("pass");
//					member.setMember_email("email");
//					member.setMember_nick("nick");
//					member.setMember_phone("phone");
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				JdbcUtil.close(rs);
//				JdbcUtil.close(pstmt);
//				JdbcUtil.close(con);
//			}
//			
//			return member;
//		}
		
		// 회원 정보 수정
		public int updateMember(MemberDTO member) {
			int updateCount = 0;
		
			PreparedStatement pstmt = null;
		
		try {
			if(member.getMember_pass().equals("")) { 
				String sql = "UPDATE member SET member_email=?, member_nick=?, member_phone=? WHERE member_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getMember_email());
				pstmt.setString(2, member.getMember_nick());
				pstmt.setString(3, member.getMember_phone());
				pstmt.setString(4, member.getMember_id());
			} else { 
				String sql = "UPDATE member SET member_pass=?, member_email=?, member_nick=?, member_phone=? WHERE member_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getMember_pass());
				pstmt.setString(2, member.getMember_email());
				pstmt.setString(3, member.getMember_nick());
				pstmt.setString(4, member.getMember_phone());
				pstmt.setString(5, member.getMember_id());
			}
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - updateMember()");
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return updateCount;
	}
		
		// 아이디 찾기
		public MemberDTO FindId(String member_phone) {
			MemberDTO member = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT member_id FROM member WHERE member_phone=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_phone);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
				member = new MemberDTO();
				member.setMember_id(rs.getString("member_id"));
				}
				
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류! - FindId()");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return member;
		}

		// 비밀번호 찾기
		public MemberDTO FindPass(String member_id, String member_email) {
			MemberDTO member = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = JdbcUtil.getConnection();
				
				String sql = "SELECT member_pass FROM member WHERE member_id=? AND member_email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				pstmt.setString(2, member_email);

				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					member = new MemberDTO();
					member.setMember_pass(rs.getString("member_pass"));
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류! - FindPass()");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return member;
		}
	
		// 비밀번호 확인
		public int checkPass(String member_pass) {
			int test = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = JdbcUtil.getConnection();
				
				String sql = "SELECT member_pass FROM member WHERE member_pass=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_pass);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					test = 1;
				}
			} catch (SQLException e) {
				System.out.println("구문 오류 - checkPass()");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			
			return test;
			
		}
	
}

