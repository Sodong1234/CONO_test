package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MsgHeaderDAO;


public class MypageListDMService {
	public ArrayList<ArrayList<String>> getArticleList(String sId) {
		System.out.println("FLService - getListCount");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		Connection con = getConnection();
		MsgHeaderDAO msgHeaderDAO = MsgHeaderDAO.getInstance();

		articleList = msgHeaderDAO.selectDMHeaderList(sId);
		
		close(con);
		
		return articleList;
	}
}
