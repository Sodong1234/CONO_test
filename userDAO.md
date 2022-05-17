```java

package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

// 일반회원가입
public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int insertMember(MemberBean member) {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			String sql = "INSERT INTO member VALUES (?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getNick());
			pstmt.setString(5, member.getPhone());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertMember()");
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 로그인 확인
	public boolean checkUser(MemberBean member) {
		boolean isLoginSuccess = false;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM member WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLoginSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return isLoginSuccess;
	}
	
	
	// 비밀번호 확인
	public int checkPass(String pass) {
		int test = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT pass FROM member WHERE pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			
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
			JdbcUtil.close(con);
		}
		
		return test;
		
	}
	
	
	// 회원 정보 조회
	public MemberBean selectMemberInfo(String id) {
		MemberBean member = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				member.setId(id);
				member.setPass(rs.getString("pass"));
				member.setEmail(rs.getString("email"));
				member.setNick(rs.getString("nick"));
				member.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return member;
	}
		
	// 회원 정보 수정
	public int updateMember(MemberBean member) {
	int updateCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			if(member.getPass().equals("")) { 
				String sql = "UPDATE member SET email=?, nick=?, phone=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getNick());
				pstmt.setString(3, member.getPhone());
				pstmt.setString(4, member.getId());
			} else { 
				String sql = "UPDATE member SET pass=?, email=?, nick=?, phone=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getPass());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getNick());
				pstmt.setString(4, member.getPhone());
				pstmt.setString(5, member.getId());
			}
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - updateMember()");
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return updateCount;
	}
	
	
	// 회원 정보 삭제
	public int deleteMember(String id) {
		int deleteCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "DELETE FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("구문 오류! - deleteMember();");
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return deleteCount;
	}
	
}
```












