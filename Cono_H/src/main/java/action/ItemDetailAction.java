package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDetailService;
import vo.ActionForward;
import vo.ImgDTO;

public class ItemDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemDetailAction");
		ActionForward forward = null;
		
		String item_idx = request.getParameter("item_idx");
		
		// 상품의 이미지 조회
		ItemDetailService service = new ItemDetailService();
		ArrayList<ImgDTO> imgList = service.selectImgList(item_idx);
		
		// 상품 정보 조회
		service = new ItemDetailService();
		String[] itemDetail = service.selectItemDetail(item_idx);
		
		
		request.setAttribute("imgList", imgList);	// 상품 이미지(imgList)를 request 객체에 저장
		request.setAttribute("itemDetail", itemDetail); // 상품 정보(itemDetail)를 request 객체에 저장
		
		forward = new ActionForward();
		forward.setPath("myshop/item_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
