package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemHideService;
import vo.ActionForward;

public class ItemHideAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ItemHideAction");
		ActionForward forward = null;
		
		String item_hide = request.getParameter("item_hide");
		String item_idx = request.getParameter("item_idx");
		
		System.out.println("item_hide : " + item_hide + ", item_idx : " + item_idx);
		
		ItemHideService service = new ItemHideService();
		boolean isUpdateSuccess = service.updateItemHide(item_hide, item_idx);
		
		if(isUpdateSuccess) {
			forward = new ActionForward();
			forward.setPath("ItemMng.shop");
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 숨김 기능 변경 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
