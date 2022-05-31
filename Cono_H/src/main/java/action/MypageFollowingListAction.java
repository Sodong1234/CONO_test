package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageFollowingListService;
import vo.ActionForward;

public class MypageFollowingListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageFollowingListAction");
		
		String sId = request.getParameter("sId");
		
		ActionForward forward = null;
		MypageFollowingListService service = new MypageFollowingListService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypageList_following_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
