package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ImgDTO;

public class ItemImgListService {

	public ArrayList<ImgDTO> selectImgList(String item_idx) {
		ArrayList<ImgDTO> imgList = null;
		
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		imgList = itemDAO.selectImgList(item_idx);
		
		
		close(con);
		
		
		return imgList;
	}

}
