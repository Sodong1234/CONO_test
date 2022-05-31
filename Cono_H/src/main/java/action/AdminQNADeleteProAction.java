package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQNADeleteProService;
import vo.ActionForward;

public class AdminQNADeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNADeleteProAction");

		ActionForward forward = null;

		String qna_idx = request.getParameter("qna_idx");
		String pageNum = request.getParameter("page");

		AdminQNADeleteProService service = new AdminQNADeleteProService();

		boolean isDeleteSuccess = service.removeArticle(qna_idx);
		if (!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("AdminQNAList.admin?page=" + pageNum);
			forward.setRedirect(true);
		}

		return forward;
	}

}
