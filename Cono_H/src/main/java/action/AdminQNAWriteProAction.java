package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminQNAWriteProService;
import vo.ActionForward;
import vo.AdminQNADTO;

public class AdminQNAWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNAWriteProAction");

		ActionForward forward = null;
		HttpSession session= request.getSession();
		String sId = (String)session.getAttribute("sId");
		AdminQNADTO adminQNADTO = new AdminQNADTO();

		String qna_idx = request.getParameter("qna_idx");
		String member_id = request.getParameter("member_id");
		String qna_type = request.getParameter("qna_type");
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");
//		int qna_re_ref = Integer.parseInt(request.getParameter("qna_re_ref"));
//		int qna_re_lev = Integer.parseInt(request.getParameter("qna_re_lev"));
//		int qna_re_seq = Integer.parseInt(request.getParameter("qna_re_seq"));
		String qna_date = request.getParameter("qna_date");
		String qna_status = request.getParameter("qna_status");

		adminQNADTO.setQna_idx(qna_idx);
		adminQNADTO.setMember_id(member_id);
		adminQNADTO.setQna_type(qna_type);
		adminQNADTO.setQna_subject(qna_subject);
		adminQNADTO.setQna_content(qna_content);
//		adminQNADTO.setQna_re_ref(qna_re_ref);
//		adminQNADTO.setQna_re_lev(qna_re_lev);
//		adminQNADTO.setQna_re_seq(qna_re_seq);
		adminQNADTO.setQna_date(qna_date);
		adminQNADTO.setQna_status(qna_status);

		AdminQNAWriteProService service = new AdminQNAWriteProService();
		boolean isWriteSuccess = service.registArticle(adminQNADTO,sId);

		if (!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("AdminQNAList.admin");
			forward.setRedirect(true);
		}

		return forward;
	}

}
