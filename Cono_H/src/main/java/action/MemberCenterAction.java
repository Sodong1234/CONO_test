package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class MemberCenterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberCenterAction");
		
		ActionForward forward = null;
		
		forward = new ActionForward();
		forward.setPath("./userCenter/user_qna_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
