package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQNAReplyProService;
import vo.ActionForward;
import vo.AdminQNADTO;

public class AdminQNAReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNAReplyProAction");

		ActionForward forward = null;

		AdminQNADTO qna = new AdminQNADTO();
		qna.setQna_idx(request.getParameter("qna_idx"));
		qna.setMember_id(request.getParameter("member_id"));
		qna.setQna_subject(request.getParameter("qna_subject"));
		qna.setQna_content(request.getParameter("qna_content"));
		qna.setQna_re_ref(Integer.parseInt(request.getParameter("qna_re_ref")));
		qna.setQna_re_lev(Integer.parseInt(request.getParameter("qna_re_lev")));
		qna.setQna_re_seq(Integer.parseInt(request.getParameter("qna_re_seq")));


		AdminQNAReplyProService service = new AdminQNAReplyProService();
		boolean isReplySuccess = service.replyArticle(qna);

		if (!isReplySuccess) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글등록 실패!')");
			out.println("history.back()");
			out.println("</script>");

		} else {

			forward = new ActionForward();
			forward.setPath("AdminQNAList.admin?page=" + request.getParameter("page"));
			forward.setRedirect(true);

		}

		return forward;
	}

}
