package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;

import dao.AdminDAO;
import vo.AdminNoticeDTO;

public class AdminNoticeWriteProService {

	public boolean registArticle(AdminNoticeDTO adminNoticeDTO) {
		System.out.println("AdminNoticeWriteProService - registArticle()");

		boolean isWriteSuccess = false;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		int insertCount = adminDAO.insertArticle(adminNoticeDTO);

		if (insertCount > 0) { // 작업 성공 시
			commit(con);

			isWriteSuccess = true;
		} else { // 작업 실패 시
			rollback(con);
		}

		close(con);

		return isWriteSuccess;
	}

}
