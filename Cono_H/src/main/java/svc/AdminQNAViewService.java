package svc;

import static db.JdbcUtil.close; 
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.AdminDAO;
import vo.AdminQNADTO;

public class AdminQNAViewService {

	public AdminQNADTO getQNA(String qna_idx, String sId) {
		System.out.println("AdminQNAViewService - getQNA()");

		AdminQNADTO adminQNADTO = null;

		Connection con = getConnection(); // static import 적용되어 있을 경우

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		adminQNADTO = adminDAO.selectQNAArticle(qna_idx,sId);

		close(con);

		return adminQNADTO;
	}

}
