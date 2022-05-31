package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.AdminDAO;

public class AdminNoticeDeleteProService {

	public boolean removeArticle(String notice_idx) {
		System.out.println("AdminNoticeDeleteProService - removeArticle()");
		boolean isDeleteSuccess = false;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		int deleteCount = adminDAO.deleteArticle(notice_idx);

		if (deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);

		return isDeleteSuccess;
	}

}
