package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQNASearchService;
import vo.ActionForward;
import vo.AdminQNADTO;

public class AdminQNASearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNASearchAction");

		ActionForward forward = null;

		String searchType = request.getParameter("searchType");
		String search = request.getParameter("search");

		AdminQNASearchService service = new AdminQNASearchService();
		ArrayList<AdminQNADTO> qnaList = service.searchQna(search, searchType);

		request.setAttribute("qnaList", qnaList);
		forward = new ActionForward();
		forward.setPath("admin_qna_search.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
