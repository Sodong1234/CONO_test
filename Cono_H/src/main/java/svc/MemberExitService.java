package svc;

import java.sql.Connection;

import dao.AdminDAO;

import static db.JdbcUtil.*;

public class MemberExitService {

	// 회원 아이디 판별 작업
	public boolean isExitMember(String member_id) {
		boolean isExitMember = false;
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		isExitMember = adminDAO.isExitMember(member_id);
		
		close(con);
		
		return isExitMember;
	}

	// 회원 탈퇴 수행
	public boolean exitMember(String member_id) {
		boolean isExitSuccess = false;
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		int exitCount = adminDAO.exitMember(member_id);
		
		if(exitCount > 0) {
			commit(con);
			isExitSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isExitSuccess;
	}
	
	
}
