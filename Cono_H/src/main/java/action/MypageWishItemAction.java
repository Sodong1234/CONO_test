package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageWishItemService;
import vo.ActionForward;

public class MypageWishItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Wish item Action");
		ActionForward forward = null;
		HttpSession session= request.getSession();
		String sId = (String)session.getAttribute("sId");
		
		MypageWishItemService service = new MypageWishItemService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypage_wishItem.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
