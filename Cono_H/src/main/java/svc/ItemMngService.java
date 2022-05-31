package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;



public class ItemMngService {

	public ArrayList<String[]> selectItemList(String member_id, String keyword, String sell_status) {
//		System.out.println("selectItemList");
		ArrayList<String[]> itemList = null;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		itemList = itemDAO.selectItemList(member_id, keyword, sell_status);
		
		
		close(con);
		
		return itemList;
	}

}
