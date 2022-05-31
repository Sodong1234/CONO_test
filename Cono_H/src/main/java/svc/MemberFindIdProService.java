package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberDTO;

public class MemberFindIdProService {

	public MemberDTO FindId(MemberDTO member) {
			System.out.println("Service - MemberFindIdPro");
			MemberDTO FindSuccess = null;
			
			Connection con = getConnection();
			
			MemberDAO memberDAO = MemberDAO.getInstance();
			
			memberDAO.setConnection(con);
			
			FindSuccess = memberDAO.FindId(member.getMember_phone());
			
			close(con);
			
			return FindSuccess;
		}

}
