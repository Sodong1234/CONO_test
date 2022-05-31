package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;

import static db.JdbcUtil.*;

public class DealListService {
	
	public int dealListCount() {
		System.out.println("DealListService - getDealListCount()");
		
		int listCount = 0;
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		listCount = adminDAO.selectDealListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<String[]> getDealList(int pageNum, int listLimit) {
		System.out.println("DealListService - getDealList()");
		
		ArrayList<String[]> dealList = null;
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		// 거래 리스트 조회
		dealList = adminDAO.selectAllDeal(pageNum, listLimit);
		
		close(con);
		
		return dealList;
	}



}
