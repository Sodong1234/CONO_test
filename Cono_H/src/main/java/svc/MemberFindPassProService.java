package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberDTO;

public class MemberFindPassProService {
	
	public MemberDTO FindPass(MemberDTO member) {
		System.out.println("Service - MemberFindPassPro");
		MemberDTO FindSuccess = null;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		FindSuccess = memberDAO.FindPass(member.getMember_id(), member.getMember_email());
		
		close(con);
		
		return FindSuccess;
	}
}
