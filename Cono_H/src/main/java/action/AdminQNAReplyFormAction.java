package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQNAViewService;
import vo.ActionForward;
import vo.AdminQNADTO;

public class AdminQNAReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNAReplyFormAction");

		ActionForward forward = null;
		String sId = request.getParameter("sId");
		String qna_idx = request.getParameter("qna_idx");

		AdminQNAViewService service = new AdminQNAViewService();
		AdminQNADTO qna = service.getQNA(qna_idx,sId);

		request.setAttribute("qna", qna);
		forward = new ActionForward();
		forward.setPath("admin_qna_reply.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
