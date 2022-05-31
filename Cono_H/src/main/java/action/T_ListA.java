package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageListDMService;
import vo.ActionForward;

public class T_ListA implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DM list Action");
		ActionForward forward = null;
		String sId= request.getParameter("sId");
		
		MypageListDMService service = new MypageListDMService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypageList_dm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
