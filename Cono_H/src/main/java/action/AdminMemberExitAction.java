package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminMemberExitService;
import vo.ActionForward;

public class AdminMemberExitAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberExitAction");
		
		ActionForward forward = null;
		
		String member_id = request.getParameter("member_id");
		String pageNum = request.getParameter("page");
		
		System.out.println(member_id);
		System.out.println(pageNum);
		
		
		AdminMemberExitService service = new AdminMemberExitService();
//		boolean isExitMember = service.isExitMember(member_id);
//		
//		if(!isExitMember) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('삭제 권한이 없습니다!')");
//			out.println("history.back()");
//			out.println("</script>");
//		} else {
		
			boolean isExitSuccess = service.exitMember(member_id);

			if(!isExitSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("AdminMemberList.admin?page=" + pageNum);
				forward.setRedirect(true);
			}
			
//		}
		
		return forward;
	}

}
