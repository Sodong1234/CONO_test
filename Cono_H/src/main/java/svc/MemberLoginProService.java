package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberDTO;

public class MemberLoginProService {
	public boolean loginMember(MemberDTO member) {
		boolean isMember = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		isMember = memberDAO.isMember(member);
		
		close(con);
		
		return isMember;
	}
}











