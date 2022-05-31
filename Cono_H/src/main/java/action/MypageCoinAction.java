package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageCoinService;
import vo.ActionForward;
import vo.CoinDTO;

public class MypageCoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Coin Action");
		ActionForward forward = null;
		HttpSession session= request.getSession();
		String sId = (String)session.getAttribute("sId");
		
		MypageCoinService service = new MypageCoinService();
		ArrayList<CoinDTO> articleList = service.getArticleList(sId);
		String coinBalance = service.getCoinBalance(sId);
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("coinBalance", coinBalance);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypage_coin.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
