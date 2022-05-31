package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminNoticeViewService;
import vo.ActionForward;
import vo.AdminNoticeDTO;

public class AdminNoticeViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeViewAction");

		ActionForward forward = null;
//		String pageNum = request.getParameter("page");
		String notice_idx = request.getParameter("notice_idx");

		AdminNoticeViewService service = new AdminNoticeViewService();
		AdminNoticeDTO notice = service.getNotice(notice_idx);

		request.setAttribute("notice", notice);
		forward = new ActionForward();
//		forward.setPath("AdminNoticeView.admin?page=" + request.getParameter("page"));
//		forward.setPath("AdminNoticeView.admin?page=" + pageNum);
		forward.setPath("admin_notice_view.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
