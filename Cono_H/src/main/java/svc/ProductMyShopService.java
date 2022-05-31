package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ShopDTO;

public class ProductMyShopService {
	
	public ShopDTO getMyShop(String member_id) {
		System.out.println("ProductMyShopService - getArticle()");
		
		ShopDTO myShop = null;
		
		Connection con = getConnection(); 
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		myShop = itemDAO.selectMyShop(member_id);
		
		
		close(con);
		
		return myShop;
	}

	public String[] getShopCountInfo(String member_id) {
		
		System.out.println("ProductMyShopService - getArticle()");
		
		String[] myShopCountInfo = null;
		
		Connection con = getConnection(); 
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		myShopCountInfo = itemDAO.selectShopCountInfo(member_id);
		
		
		close(con);
		
		return myShopCountInfo;
	}

	


	

	
	
	}







