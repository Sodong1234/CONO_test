package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.AdminQNADTO;

public class AdminQNAListService {

	public int getListCount() {
		System.out.println("AdminQNAListService - getListCount()");

		int listCount = 0;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		listCount = adminDAO.selectQNAListCount();

		close(con);

		return listCount;
	}

	public ArrayList<AdminQNADTO> getArticleList(int pageNum, int listLimit) {
		System.out.println("AdminQNAListService - getArticleList()");

		ArrayList<AdminQNADTO> qnaList = null;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		qnaList = adminDAO.selectQNAList(pageNum, listLimit);

		close(con);

		return qnaList;
	}

}
