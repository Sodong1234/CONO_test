package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ItemDAO;

public class ItemHideService {

	public boolean updateItemHide(String item_hide, String item_idx) {
//		System.out.println("ItemHideService - updateItemHide");
		boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		int updateCount = itemDAO.updateItemHide(item_hide, item_idx);
		
//		System.out.println("updateCount : " + updateCount);
		
		if(updateCount > 0) {
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUpdateSuccess;
	}

}
