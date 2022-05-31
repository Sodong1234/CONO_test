package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberExitService;
import vo.ActionForward;

public class MemberExitAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberExitAction");
		
		ActionForward forward = null;
		
		String member_id = request.getParameter("member_id");
		String pageNum = request.getParameter("page");
		
		MemberExitService service = new MemberExitService();
		boolean isExitMember = service.isExitMember(member_id);
		
		if(!isExitMember) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
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
				forward.setPath("AdminMemberList?page=" + pageNum);
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}
