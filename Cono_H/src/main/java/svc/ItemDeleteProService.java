package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;

public class ItemDeleteProService {

	public boolean deleteItem(String item_idx) {
		boolean isDelete = false;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		int[] deleteCount = itemDAO.deleteItem(item_idx);
		
		for(int i = 0; i < deleteCount.length; i++) {
			if(i == 1) {
				continue;
			}
			if(deleteCount[i] <= 0) {
				isDelete = false;
				break;
			}
			isDelete = true;
		}
		
		if(deleteCount[0] > 0 && deleteCount[5] > 0) {
			commit(con);
			isDelete = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isDelete;
	}

}
