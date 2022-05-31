package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberFindPassProService;
import vo.ActionForward;
import vo.MemberDTO;

public class MemberFindPassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindPassAction");
		ActionForward forward = null;
		
		// 폼 파라미터 가져와서 MemberDTO 객체에 저장
		MemberDTO member = new MemberDTO();
		member.setMember_id(request.getParameter("id"));
		member.setMember_email(request.getParameter("email"));
		
		MemberFindPassProService service = new MemberFindPassProService();
		MemberDTO FindSuccess = service.FindPass(member);
		
		request.setAttribute("dtoPass", FindSuccess);
		// 비밀번호 찾기 작업 요청 결과에 따른 판별 작업 수행
		if(FindSuccess == null) { // 찾기 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 입력 정보입니다!!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 찾기 성공
			response.setContentType("text/html; charset=UTF-8");
			
			forward = new ActionForward();
			forward.setPath("./MemberFindPassResult.func");
			forward.setRedirect(false);
		}
		return forward;
	}

}
