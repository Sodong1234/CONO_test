package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberModifyProService;
import vo.ActionForward;
import vo.MemberDTO;

public class MypageModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("mypageModifyAction");
		ActionForward forward = null;
		
		// 폼 파라미터 가져와서 MemberDTO 객체에 저장
		MemberDTO member = new MemberDTO();
		member.setMember_id(request.getParameter("member_id"));
		member.setMember_pass(request.getParameter("member_pass"));
		member.setMember_email(request.getParameter("member_email"));
		member.setMember_nick(request.getParameter("member_nick"));
		member.setMember_phone(request.getParameter("member_phone"));
		
		MemberModifyProService service = new MemberModifyProService();
		boolean isModifySuccess = service.ModifyMember(member);
		
		// 등록 작업 요청 결과에 따른 판별 작업 수행
		if(!isModifySuccess) { // 등록 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('올바른 값을 입력하세요!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 등록 성공
			// ActionForward 객체를 통해 메인페이지 포워딩 설정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 수정이 완료되었습니다.')");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("./");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
