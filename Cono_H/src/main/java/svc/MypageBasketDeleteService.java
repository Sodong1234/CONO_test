package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MypageDAO;

public class MypageBasketDeleteService {
	public int getDeleteCount(String item_idx) {
		System.out.println("MypageBasketDeleteService");
		
		int deleteCount = 0;
		
		Connection con = getConnection();

		MypageDAO mypageDAO = MypageDAO.getInstance();
		
		mypageDAO.setConnection(con);
		
		deleteCount = mypageDAO.deleteBasketItem(item_idx);
		
		if(deleteCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return deleteCount;

	}
}
