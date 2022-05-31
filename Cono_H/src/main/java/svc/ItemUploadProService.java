package svc;

import vo.CategoryDTO;
import vo.ImgDTO;
import vo.ItemDTO;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;

public class ItemUploadProService {

	public boolean uploadItem(ItemDTO item,ArrayList<ImgDTO> imgList, String member_id, CategoryDTO categoryDTO) {
//		System.out.println("ItemUploadProService");
		boolean isUploadSuccess = false;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		int[] insertCount = itemDAO.insertItem(item, imgList, categoryDTO, member_id);
		
		if(insertCount[0] > 0 && insertCount[1] > 0) {
			commit(con);
			isUploadSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUploadSuccess;
	}
	
}
