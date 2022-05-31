package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageBasketDeleteService;
import vo.ActionForward;

public class MypageBasketDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageBasketDeleteAction");
		
		String item_idx = request.getParameter("item_idx");
		
		ActionForward forward = null;
		
		MypageBasketDeleteService service = new MypageBasketDeleteService();
		int deleteCount = service.getDeleteCount(item_idx);
		
		if(deleteCount > 0) {
			forward = new ActionForward();
			forward.setPath("Mypage_basket.mypage");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
