package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MypageDAO;
import vo.CoinDTO;

public class MypageCoinService {
	public ArrayList<CoinDTO> getArticleList(String sId) {
		System.out.println("Purchased item - getListCount");
		
		ArrayList<CoinDTO> articleList = new ArrayList<CoinDTO>();
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		articleList = mypageDAO.coinHistory(sId);
		
		
		close(con);
		
		return articleList;
	}
	public String getCoinBalance(String sId) {
		System.out.println("getCoinBalance");
		
		String coinBalance = "";
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		coinBalance = mypageDAO.coinBalance(sId);
		
		close(con);
		
		return coinBalance;
	}
}
