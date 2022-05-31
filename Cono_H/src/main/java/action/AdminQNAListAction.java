package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminQNAListService;
import vo.ActionForward;
import vo.AdminQNADTO;
import vo.PageInfo;

public class AdminQNAListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminQNAListAction");

		ActionForward forward = null;

//		HttpSession session = request.getSession();
//		String sId = (String) session.getAttribute("sId");
		int pageNum = 1; // 현재 페이지 번호
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수

		if (request.getParameter("page") != null) {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}

		AdminQNAListService service = new AdminQNAListService();
		int listCount = service.getListCount();
		ArrayList<AdminQNADTO> qnaList = service.getArticleList(pageNum, listLimit);
		System.out.println(qnaList);

		int maxPage = (int) Math.ceil((double) listCount / listLimit);

		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;

		int endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo(pageNum, maxPage, startPage, endPage, listCount);

		request.setAttribute("pageInfo", pageInfo); // 페이징 처리 정보 객체
		request.setAttribute("qnaList", qnaList); // 게시물 목록 객체

		forward = new ActionForward();
		forward.setPath("./admin_qna_list.jsp");
		forward.setRedirect(false); // Dispatcher 방식(생략 가능)

		return forward;

	}

}
