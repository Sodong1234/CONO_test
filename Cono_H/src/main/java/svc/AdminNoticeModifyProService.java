package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.AdminDAO;
import vo.AdminNoticeDTO;

public class AdminNoticeModifyProService {

	public boolean modifynotice(AdminNoticeDTO notice) {
		boolean isModifySuccess = false;

		Connection con = getConnection();

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		int modifyCount = adminDAO.modifyNotice(notice);

		if (modifyCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		close(con);

		return isModifySuccess;
	}

}
