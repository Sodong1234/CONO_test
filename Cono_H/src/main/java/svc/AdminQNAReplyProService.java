package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.AdminDAO;
import vo.AdminQNADTO;

public class AdminQNAReplyProService {

	public boolean replyArticle(AdminQNADTO qna) {
		System.out.println("AdminQNAReplyProService - replyArticle ");
		boolean isReplySuccess = false;

		Connection con = getConnection();

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		int insertCount = adminDAO.insertReplyArticle(qna);

		if (insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		} else {
			rollback(con);
		}
		close(con);

		return isReplySuccess;
	}

}
