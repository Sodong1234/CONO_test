package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;
import vo.MemberDTO;
import vo.ShopDTO;

public class ProductMyShopModifyProService {

	public boolean isShopWriter(String member_id, String member_pass) {
	
		boolean isShopWriter = false;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		// BoardDAO 의 isArticleWriter() 메서드를 호출하여 패스워드 판별
		// => 파라미터 : 글번호(board_num), 패스워드(board_pass)
		//    리턴타입 : boolean(isArticleWriter)
		isShopWriter = itemDAO.isShopWriter(member_id, member_pass);
		
		close(con);
		
		return isShopWriter;
	}
	
	public boolean modifyMyShop(ShopDTO myShop, MemberDTO member) {

		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		
		itemDAO.setConnection(con);
		
		int updateCount = itemDAO.updateShop(myShop,member);
		
		// updateCount 가 0보다 크면 commit, 아니면 rollback 작업 수행
		if(updateCount > 0) {
			commit(con);
			// isModifySuccess 를 true 로 변경
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isModifySuccess;
	}

}











