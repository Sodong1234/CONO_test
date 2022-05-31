package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberFindIdProService;
import vo.ActionForward;
import vo.MemberDTO;

public class MemberFindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindIdAction");
		ActionForward forward = null;
		
		// 폼 파라미터 가져와서 MemberDTO 객체에 저장
		MemberDTO member = new MemberDTO();
		member.setMember_phone(request.getParameter("phone"));
		
		MemberFindIdProService service = new MemberFindIdProService();
		MemberDTO FindSuccess = service.FindId(member);
		
		request.setAttribute("dtoId", FindSuccess);
		// 아이디 찾기 작업 요청 결과에 따른 판별 작업 수행
		if(FindSuccess == null) { // 찾기 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록되지 않은 전화번호입니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 찾기 성공
			response.setContentType("text/html; charset=UTF-8");
			
			forward = new ActionForward();
			forward.setPath("./MemberFindIdResult.func");
			forward.setRedirect(false);
		}
		return forward;
	}


}
