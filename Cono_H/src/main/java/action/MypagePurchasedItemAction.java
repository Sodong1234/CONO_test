package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypagePurchasedItemService;
import vo.ActionForward;

public class MypagePurchasedItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypagePurchasedItemAction");
		ActionForward forward = null;
		HttpSession session= request.getSession();
		String sId = (String)session.getAttribute("sId");
		
		MypagePurchasedItemService service = new MypagePurchasedItemService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypage_purchasedItem.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
