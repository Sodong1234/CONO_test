package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.AdminNoticeDTO;

public class AdminNoticeSearchService {

	public ArrayList<AdminNoticeDTO> searchNotice(String search, String searchType, String notice_idx) {
		System.out.println("AdminNoticeSearchService");
		ArrayList<AdminNoticeDTO> noticeList = null;

		Connection con = getConnection();

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		noticeList = adminDAO.searchNoticeList(search, searchType, notice_idx);

		close(con);

		return noticeList;
	}

}
