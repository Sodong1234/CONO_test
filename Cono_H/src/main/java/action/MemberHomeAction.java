package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class MemberHomeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberHomeAction");
		
		ActionForward forward = null;
		
		forward = new ActionForward();
		forward.setPath("./main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
