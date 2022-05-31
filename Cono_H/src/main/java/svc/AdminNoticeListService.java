package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.AdminNoticeDTO;

public class AdminNoticeListService {

	public int getListCount() {
		System.out.println("AdminNoticeListService - getListCount()");

		int listCount = 0;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		listCount = adminDAO.selectNoticeListCount();

		close(con);

		return listCount;
	}

	public ArrayList<AdminNoticeDTO> getArticleList(int pageNum, int listLimit) {
		System.out.println("AdminNoticeListService - getArticleList()");

		ArrayList<AdminNoticeDTO> noticeList = null;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		noticeList = adminDAO.selectNoticeList(pageNum, listLimit);

		close(con);

		return noticeList;
	}

}
