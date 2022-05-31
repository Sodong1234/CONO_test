package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminNoticeWriteProService;
import vo.ActionForward;
import vo.AdminNoticeDTO;

public class AdminNoticeWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminWriteProAction");

		ActionForward forward = null;

		AdminNoticeDTO adminNoticeDTO = new AdminNoticeDTO();

		String notice_idx = request.getParameter("notice_idx");
		String admin_id = request.getParameter("admin_id");
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");
		String notice_date = request.getParameter("notice_date");

		adminNoticeDTO.setNotice_idx(notice_idx);
		adminNoticeDTO.setAdmin_id(admin_id);
		adminNoticeDTO.setNotice_subject(notice_subject);
		adminNoticeDTO.setNotice_content(notice_content);
		adminNoticeDTO.setNotice_date(notice_date);

		AdminNoticeWriteProService service = new AdminNoticeWriteProService();
		boolean isWriteSuccess = service.registArticle(adminNoticeDTO);

		if (!isWriteSuccess) { // 글쓰기 실패 시(결과값이 false 일 경우)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 글쓰기 성공 시(결과값이 true 일 경우)
			forward = new ActionForward();
			forward.setPath("AdminNoticeList.admin");
			forward.setRedirect(true);
		}

		return forward;
	}

}
