package svc;

import java.sql.Connection;

import dao.AdminDAO;

import static db.JdbcUtil.*;

public class AdminDealCancelService {

	public boolean dealCancelService(String item_idx, String coin_use, String safe_status) {
		System.out.println("AdminDealCancelService");
		
		boolean dealCancelSuccess = false;
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		System.out.println(item_idx);
		System.out.println(safe_status);
		int dealCancel = adminDAO.dealCancel(item_idx, coin_use, safe_status);
		
		System.out.println("svc - deal");
		
		if(dealCancel > 0) {
			dealCancelSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return dealCancelSuccess;
	}
	
	
}
