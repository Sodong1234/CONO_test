package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminNoticeModifyProService;
import vo.ActionForward;
import vo.AdminNoticeDTO;

public class AdminNoticeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeModifyProAction");

		ActionForward forward = null;

		String notice_idx = request.getParameter("notice_idx");
		String admin_id = request.getParameter("admin_id");
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");

		AdminNoticeModifyProService service = new AdminNoticeModifyProService();

		AdminNoticeDTO notice = new AdminNoticeDTO();
		notice.setNotice_idx(notice_idx);
		notice.setAdmin_id(admin_id);
		notice.setNotice_subject(notice_subject);
		notice.setNotice_content(notice_content);

		boolean isModifySuccess = service.modifynotice(notice);

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
			forward.setPath("AdminNoticeList.admin");
			forward.setRedirect(true);

		}

		return forward;
	}

}
