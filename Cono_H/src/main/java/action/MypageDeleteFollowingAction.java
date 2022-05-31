package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageDeleteFollowingService;
import vo.ActionForward;

public class MypageDeleteFollowingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("mypageFollowDeleteAction");
		
		ActionForward forward = null;
		String sId = request.getParameter("sId");
		String shop_idx = request.getParameter("shop_idx");
		
		System.out.println("sId = " + sId);
		MypageDeleteFollowingService service = new MypageDeleteFollowingService();
		int deleteCount = service.deleteFollowing(sId, shop_idx);
		
		if(deleteCount > 0) {
			forward = new ActionForward();
			forward.setPath("MypageFollowingList.mypage");
			forward.setRedirect(false);
		} else {
			System.out.println("삭제 실패");
			// 삭제실패
		}
		
		
		return forward;
	}

}
