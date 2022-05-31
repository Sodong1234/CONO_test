package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.ImgDTO;

public class ItemModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemModifyFormAction");
		ActionForward forward = null;
		
		String item_idx = request.getParameter("item_idx");

		// 상품의 이미지 조회
		ItemDetailService service = new ItemDetailService();
		ArrayList<ImgDTO> imgList = service.selectImgList(item_idx);
		
		// 상품 정보 조회
		service = new ItemDetailService();
		String[] itemDetail = service.selectItemDetail(item_idx);
		
		request.setAttribute("imgList", imgList);
		request.setAttribute("itemDetail", itemDetail);
		
		forward = new ActionForward();
		forward.setPath("myshop/item_modify.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
