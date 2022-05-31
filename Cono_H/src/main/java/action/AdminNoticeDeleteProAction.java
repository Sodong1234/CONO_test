package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminNoticeDeleteProService;
import vo.ActionForward;

public class AdminNoticeDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeDeleteProAction");

		ActionForward forward = null;

		String notice_idx = request.getParameter("notice_idx");
		String pageNum = request.getParameter("page");

		AdminNoticeDeleteProService service = new AdminNoticeDeleteProService();

		boolean isDeleteSuccess = service.removeArticle(notice_idx);
		if (!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("AdminNoticeList.admin?page=" + pageNum);
			forward.setRedirect(true);
		}

		return forward;
	}

}
