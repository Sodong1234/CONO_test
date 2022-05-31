package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageBasketService;
import vo.ActionForward;

public class MypageBasketAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Reserved item Action");
		ActionForward forward = null;
		HttpSession session= request.getSession();
		String sId = (String)session.getAttribute("sId");
		
		MypageBasketService service = new MypageBasketService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypage_basket.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
