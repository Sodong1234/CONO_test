package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MypageDAO;

public class MypageCouponService {
	public ArrayList<ArrayList<String>> getArticleList(String sId) {
		System.out.println("couponService - couponList");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		 articleList = mypageDAO.selectCouponList(sId);
		
		close(con);
		
		return articleList;
	}
}
