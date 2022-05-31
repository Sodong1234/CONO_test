package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.FollowDAO;

public class MypageDeleteFollowingService {
	public int deleteFollowing(String sId, String shop_idx) {
		System.out.println("DeleteFollowing");
		
		int deleteCount = 0;
		
		Connection con = getConnection();
		FollowDAO followDAO = FollowDAO.getInstance();
		followDAO.setConnection(con);
	
		deleteCount = followDAO.deleteFollowing(sId, shop_idx);
		
		if(deleteCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return deleteCount;
	}
}
