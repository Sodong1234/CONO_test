package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypagePassProService;
import vo.ActionForward;
import vo.MemberDTO;

public class MypagePassProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPagePass");
		ActionForward forward = null;
		
		// 폼 파라미터 가져와서 MemberDTO 객체에 저장
		MemberDTO member = new MemberDTO();
		member.setMember_pass(request.getParameter("pass"));
		
		MypagePassProService service = new MypagePassProService();
		boolean isCheckSuccess = service.checkPass(member);
		
		// 비밀번호 재확인 작업 요청 결과에 따른 판별 작업 수행
		if(!isCheckSuccess) { // 재확인 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('올바르지 않은 패스워드입니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 재확인 성공
			response.setContentType("text/html; charset=UTF-8");
			
			forward = new ActionForward();
			forward.setPath("./Mypage.mypage");
			forward.setRedirect(false);
		}
		return forward;
	}

}
