package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminQNAModifyProService;
import vo.ActionForward;
import vo.AdminQNADTO;

public class AdminQNAModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNAModifyProAction");

		ActionForward forward = null;

		String qna_idx = request.getParameter("qna_idx");
		String qna_type = request.getParameter("qna_type");
		HttpSession session= request.getSession();
	    String sId = (String)session.getAttribute("sId");
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");

		AdminQNAModifyProService service = new AdminQNAModifyProService();

		AdminQNADTO qna = new AdminQNADTO();
		qna.setQna_idx(qna_idx);
		qna.setQna_type(qna_type);
		qna.setMember_id(sId);
		qna.setQna_subject(qna_subject);
		qna.setQna_content(qna_content);

		System.out.println(qna_subject+","+request.getParameter("qna_subject"));
		
		boolean isModifySuccess = service.modifyQna(qna);

		if (!isModifySuccess) { // 수정 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");

		} else {

			forward = new ActionForward();
//				forward.setPath("AdminNoticeList.admin?page=" + request.getParameter("page"));
			forward.setPath("AdminQNAList.admin");
			forward.setRedirect(true);

		}

		return forward;

	}

}
