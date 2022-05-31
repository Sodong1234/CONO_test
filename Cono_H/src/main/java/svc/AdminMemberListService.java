package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.MemberDTO;

import static db.JdbcUtil.*;

public class AdminMemberListService {

	public int getListCount() {
		System.out.println("MemberListService - getListCount()");
		
		int listCount = 0;
		
		Connection con = getConnection();
		
		AdminDAO  adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		//총 게시물 수 조회
		listCount = adminDAO.selectMemberListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<String[]> getMemberList(int pageNum, int listLimit, String searchType, String search) {
		System.out.println("MemberListService - getMemberList()");
		
		ArrayList<String[]> memberList  = null;
		
		Connection con = getConnection();
		
		AdminDAO  adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		// 게시물 목록 조회
		memberList = adminDAO.selectAllMember(pageNum, listLimit, searchType, search);
		
		close(con);
		
		return memberList;
	}

}
