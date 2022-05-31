package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminNoticeSearchService;
import vo.ActionForward;
import vo.AdminNoticeDTO;

public class AdminNoticeSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeSearchAction");

		ActionForward forward = null;
		String notice_idx = request.getParameter("notice_idx");
		String searchType = request.getParameter("searchType");
		String search = request.getParameter("search");

		AdminNoticeSearchService service = new AdminNoticeSearchService();
		ArrayList<AdminNoticeDTO> noticeList = service.searchNotice(search, searchType,notice_idx);

		request.setAttribute("noticeList", noticeList);
		forward = new ActionForward();
		forward.setPath("admin_notice_search.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
