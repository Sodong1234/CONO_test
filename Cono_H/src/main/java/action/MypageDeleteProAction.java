package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MypageDeleteProService;
import vo.ActionForward;
import vo.MemberDTO;

public class MypageDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("mypageDeleteProAction");
		ActionForward forward = null;
		
		MemberDTO member = new MemberDTO();
		
		HttpSession session = request.getSession();
		
		session.getAttribute("sId");
		member.setMember_id((String)session.getAttribute("sId"));
		
		MypageDeleteProService service = new MypageDeleteProService();
		boolean isDelete = service.DeleteMember(member);
		
		if(isDelete) { // 삭제 성공
			
			session.invalidate();
			forward = new ActionForward();
			forward.setPath("./");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
