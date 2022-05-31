package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

public class MypageWishItemService {
	public ArrayList<ArrayList<String>> getArticleList(String sId) {
		System.out.println("Wish item - getListCount");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		Connection con = getConnection();

		
		close(con);
		
		return articleList;
	}
}
