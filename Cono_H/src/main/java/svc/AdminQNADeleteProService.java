package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.AdminDAO;

public class AdminQNADeleteProService {

	public boolean removeArticle(String qna_idx) {
		System.out.println("AdminQNADeleteProService - removeArticle()");
		boolean isDeleteSuccess = false;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		int deleteCount = adminDAO.deleteQNAArticle(qna_idx);

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
