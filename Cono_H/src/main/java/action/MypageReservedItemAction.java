package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageReservedItemService;
import vo.ActionForward;

public class MypageReservedItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Reserved item Action");
		ActionForward forward = null;
		HttpSession session= request.getSession();
		String sId = (String)session.getAttribute("sId");
		
		MypageReservedItemService service = new MypageReservedItemService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypage_reservedItem.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
