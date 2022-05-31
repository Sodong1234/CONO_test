package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ProductMyShopService;
import vo.ActionForward;
import vo.ShopDTO;

public class ProductMyShopModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductMyShopModifyFormAction");
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("sId");
		
		ProductMyShopService service = new ProductMyShopService();
		ShopDTO myShop = service.getMyShop(member_id);
		request.setAttribute("myShop", myShop);
		
		// ActionForward 객체 생성 및 포워딩 정보 설정(Dispatcher 방식)
		forward = new ActionForward();
		forward.setPath("./myshop/my_page_modify.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}













