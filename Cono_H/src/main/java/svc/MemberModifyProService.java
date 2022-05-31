package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberDTO;

public class MemberModifyProService {
	public boolean ModifyMember(MemberDTO member) {
		System.out.println("Service - ModifyMember");
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int updateCount = memberDAO.updateMember(member);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
	}
}
