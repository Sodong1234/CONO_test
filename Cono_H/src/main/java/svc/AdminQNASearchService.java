package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.AdminQNADTO;

public class AdminQNASearchService {

	public ArrayList<AdminQNADTO> searchQna(String search, String searchType) {
		System.out.println("AdminQNASearchService");
		ArrayList<AdminQNADTO> qnaList = null;

		Connection con = getConnection();

		AdminDAO adminDAO = AdminDAO.getInstance();

		adminDAO.setConnection(con);

		qnaList = adminDAO.searchQNAList(search, searchType);

		close(con);

		return qnaList;
	}

}
