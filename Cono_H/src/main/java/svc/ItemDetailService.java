package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ImgDTO;

public class ItemDetailService {
	
	// 상품 이미지 조회하는 서비스
		public ArrayList<ImgDTO> selectImgList(String item_idx) {
			System.out.println("ItemImgListService");
			ArrayList<ImgDTO> imgList = null;
			
			
			Connection con = getConnection();
			
			ItemDAO itemDAO = ItemDAO.getInstance();
			
			itemDAO.setConnection(con);
			
			imgList = itemDAO.selectImgList(item_idx);
			
			
			close(con);
			
			
			return imgList;
		}
	
	// 상품 정보 조회하는 서비스
	public String[] selectItemDetail(String item_idx) {
		System.out.println("ItemDetailService");
		String[] itemDetail = null;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		itemDetail = itemDAO.selectItemDetail(item_idx);
		
		
		close(con);
		
		return itemDetail;
	}
}
