package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageFollowerListService;
import vo.ActionForward;

public class MypageFollowerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageFollowerListAction");
		
		String sId = request.getParameter("sId");
		
		ActionForward forward = null;
		MypageFollowerListService service = new MypageFollowerListService();
		
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypageList_follower_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
