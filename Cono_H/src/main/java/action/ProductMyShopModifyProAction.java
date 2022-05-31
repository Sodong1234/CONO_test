package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProductMyShopModifyProService;
import vo.ActionForward;
import vo.MemberDTO;
import vo.ShopDTO;

public class ProductMyShopModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductMyShopModifyProAction");
		
		ActionForward forward = null;
		
		
		String member_id = request.getParameter("member_id");
		String member_pass = request.getParameter("member_pass");
		String shop_name = request.getParameter("shop_name");
		String shop_content = request.getParameter("shop_content");
		String shop_idx = request.getParameter("shop_idx");
		
		System.out.println(member_id);
		System.out.println(member_pass);
		System.out.println(shop_name);
		System.out.println(shop_content);
		System.out.println(shop_idx);
		
		// 수정 권한 판별을 위해 전달받은 파라미터 중 패스워드 비교
		
		ProductMyShopModifyProService service = new ProductMyShopModifyProService();
		boolean isShopWriter = service.isShopWriter(member_id, member_pass);
		
		// 수정 가능 여부 판별
		if(!isShopWriter) { // 패스워드가 일치하지 않을 경우(= 수정 권한 없음)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 패스워드가 일치할 경우(= 수정 권한 있음)
			ShopDTO myShop = new ShopDTO();
			MemberDTO member = new MemberDTO();
			myShop.setMember_id(member_id);
			member.setMember_pass(member_pass);
			myShop.setShop_idx(shop_idx);
			myShop.setShop_name(shop_name);
			myShop.setShop_content(shop_content);
			
			boolean isModifySuccess = service.modifyMyShop(myShop,member);
			
			// 수정 완료 결과 판별 후 실패 시 자바스크립트로 "수정 실패!" 출력 후 이전페이지 이동
			if(!isModifySuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				// 수정 성공 
				forward = new ActionForward();
				forward.setPath("ProductMyshop.shop");
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}







