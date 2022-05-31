package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemMngService;
import vo.ActionForward;

public class ItemMngAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ItemMngAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("sId");
		
		String keyword = request.getParameter("keyword");
		String sell_status = request.getParameter("sell_status");
		
		ItemMngService service = new ItemMngService();
		ArrayList<String[]> itemList = service.selectItemList(member_id, keyword, sell_status);
		
		request.setAttribute("itemList", itemList);
		
		forward = new ActionForward();
		forward.setPath("myshop/item_mng.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
