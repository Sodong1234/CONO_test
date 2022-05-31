package action;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminDealCancelService;
import vo.ActionForward;

public class AdminDealCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminDealCancelAction");
		
		ActionForward forward = null;
		
		String item_idx = request.getParameter("item_idx");
		String coin_use = request.getParameter("coin_use");
		String safe_status = request.getParameter("safe_status");
		
		System.out.println(item_idx);
		System.out.println(safe_status);
		
		AdminDealCancelService service = new AdminDealCancelService();
		
		boolean dealCancelSuccess= service.dealCancelService(item_idx, coin_use, safe_status);
		
		if(!dealCancelSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('거래 취소를 실패하였습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("AdminDealList.admin");
//			?page=" + request.getParameter("page")
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
