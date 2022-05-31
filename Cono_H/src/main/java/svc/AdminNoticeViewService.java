package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.AdminDAO;
import vo.AdminNoticeDTO;

public class AdminNoticeViewService {

	public AdminNoticeDTO getNotice(String notice_idx) {
		System.out.println("AdminNoticeViewService - getNotice()");

		AdminNoticeDTO adminNoticeDTO = null;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		adminNoticeDTO = adminDAO.selectArticle(notice_idx);

		close(con);

		return adminNoticeDTO;
	}

}
