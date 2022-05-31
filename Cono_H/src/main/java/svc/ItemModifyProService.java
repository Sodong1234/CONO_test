package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.CategoryDTO;
import vo.ImgDTO;
import vo.ItemDTO;

public class ItemModifyProService {

	public boolean ModifyItem(ItemDTO item, ArrayList<ImgDTO> imgList, String member_id, CategoryDTO categoryDTO) {
		System.out.println("ItemModifyProService");
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		int[] updateCount = itemDAO.updateItem(item, imgList, categoryDTO, member_id);
		
		if(updateCount[0] > 0 && updateCount[1] > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isModifySuccess;
	}

	public ArrayList<String> selectImgList(String item_idx) {
		
		ArrayList<String> imgRealNames = null;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		imgRealNames = itemDAO.selectImgNames(item_idx);
		
		close(con);
		
		return imgRealNames;
	}

}
