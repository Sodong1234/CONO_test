package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminNoticeViewService;
import vo.ActionForward;
import vo.AdminNoticeDTO;

public class AdminNoticeModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeModifyFormAction");

		ActionForward forward = null;

		String notice_idx = request.getParameter("notice_idx");

		AdminNoticeViewService service = new AdminNoticeViewService();
		AdminNoticeDTO notice = service.getNotice(notice_idx);

		request.setAttribute("notice", notice);
		forward = new ActionForward();
		forward.setPath("admin_notice_modify.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
