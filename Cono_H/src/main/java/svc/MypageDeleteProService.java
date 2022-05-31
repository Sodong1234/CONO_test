package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberDTO;

public class MypageDeleteProService {
	public boolean DeleteMember(MemberDTO member) {
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int deleteCount = memberDAO.deleteMember(member);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}
}
