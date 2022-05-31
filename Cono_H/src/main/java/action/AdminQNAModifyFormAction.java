package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminQNAViewService;
import vo.ActionForward;
import vo.AdminQNADTO;

public class AdminQNAModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNAModifyFormAction");

		ActionForward forward = null;
		HttpSession session = request.getSession();
		String sId = (String) session.getAttribute("sId");
		String qna_idx = request.getParameter("qna_idx");

		AdminQNAViewService service = new AdminQNAViewService();
		AdminQNADTO qna = service.getQNA(qna_idx,sId);

		request.setAttribute("qna", qna);
		forward = new ActionForward();
		forward.setPath("admin_qna_modify.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
