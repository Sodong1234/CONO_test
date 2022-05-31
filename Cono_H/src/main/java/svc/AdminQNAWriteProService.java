package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.AdminDAO;
import vo.AdminQNADTO;

public class AdminQNAWriteProService {

	public boolean registArticle(AdminQNADTO adminQNADTO, String sId) {
		System.out.println("AdminQNAWriteProService - registArticle()");

		boolean isWriteSuccess = false;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		int insertCount = adminDAO.insertArticle(adminQNADTO,sId);

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
