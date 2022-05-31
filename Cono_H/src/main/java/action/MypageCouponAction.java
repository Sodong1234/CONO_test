package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageCouponService;
import vo.ActionForward;

public class MypageCouponAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CouponAction");
		ActionForward forward = null;
		
		String sId = request.getParameter("sId");
		
		MypageCouponService service = new MypageCouponService();
		ArrayList<ArrayList<String>> articleList = service.getArticleList(sId);
		
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("./mypage/mypage_coupon.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
