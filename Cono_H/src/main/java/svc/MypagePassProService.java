package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;


import dao.MemberDAO;
import vo.MemberDTO;

public class MypagePassProService {

	public boolean checkPass(MemberDTO member) {
		System.out.println("Service - myPagePassPro");
		boolean isCheckSuccess = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int test = memberDAO.checkPass(member.getMember_pass());

		if(test == 1) {
			isCheckSuccess = true;
		}
		
		close(con);
		
		return isCheckSuccess;
	}

}
