package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminMemberListService;
import vo.ActionForward;
import vo.PageInfo;

public class AdminMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberListAction");
		
		ActionForward forward = null;
		
		// 페이징 처리
		int pageNum = 1;
		int listLimit = 8;
		int pageLimit = 5;
		
		if(request.getParameter("page") != null) {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		// 검색조건 & 검색 내용
		String searchType = request.getParameter("searchType");
		String search = request.getParameter("search");
		
		AdminMemberListService service = new AdminMemberListService();
		
		// 총 게시물 수 조회
		int listCount = service.getListCount();
		
		// 게시물 목록 가져오기
		ArrayList<String[]> memberList = service.getMemberList(pageNum, listLimit, searchType, search);
		
		//페이징 처리 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);

		// 2. 현재 페이지에서 보여줄 시작 페이지 번호(1, 11, 21 등의 시작 번호) 계산
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;

		// 3. 현재 페이지에서 보여줄 끝 페이지 번호(10, 20, 30 등의 끝 번호) 계산
		int endPage = startPage + pageLimit - 1;

		// 4. 만약, 끝 페이지(endPage)가 현재 페이지에서 표시할 총 페이지 수(maxPage)보다 클 경우
		//    끝 페이지 번호를 총 페이지 수로 대체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo(pageNum, maxPage, startPage, endPage, listCount);
		
		// 뷰페이지로 전달
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("memberList", memberList);
		
		forward = new ActionForward();
		forward.setPath("../admin/admin_member.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
