package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ItemUploadProService;
import vo.ActionForward;
import vo.CategoryDTO;
import vo.ImgDTO;
import vo.ItemDTO;

public class ItemUploadProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ItemUploadProAction");
		
		ActionForward forward = null;
		
		// --------------------------------
		
		String uploadPath = "upload";	// 파일 업로드 가상경로
		
		int fileSize = 1024 * 1024 * 10;	// 파일 사이즈
		
		ServletContext context = request.getServletContext();
		
		String realPath = context.getRealPath(uploadPath);	// 파일 업로드 실제 경로
		
		System.out.println(uploadPath + ", " + realPath);
		
		MultipartRequest multi = new MultipartRequest(
				request,
				realPath,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		
		ArrayList<String> fileArr = new ArrayList<String>();	// 파일 이름 저장 List
		ArrayList<String> orgFileArr = new ArrayList<String>();	// 파일 실제 이름 저장 List
		
		
		while (files.hasMoreElements()) {	// files 안의 요소가 없을 때까지 반복
			
			String name = files.nextElement().toString();
			String filename = multi.getFilesystemName(name); // 서버에 저장되는 이름
			String orgFileName = multi.getOriginalFileName(name);	// 파일 실제 이름
//			System.out.println(filename + ", " + orgFileName);
			
			fileArr.add(filename);
			orgFileArr.add(orgFileName);
		}
		
		// session에서 받아온 member_id 저장
		String member_id = multi.getParameter("member_id");
		
		// 카테고리 정보를 CategoryDTO에 저장
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setCategory_big(multi.getParameter("category_big"));
		categoryDTO.setCategory_small(multi.getParameter("category_small"));
		
		// item 정보를 ItemDTO에 저장
		ItemDTO item = new ItemDTO();
		item.setItem_title(multi.getParameter("item_title"));
		item.setItem_content(multi.getParameter("item_content"));
		item.setItem_region(multi.getParameter("item_region"));
		item.setItem_price(multi.getParameter("item_price"));
		item.setItem_quantity(multi.getParameter("item_quantity"));
		
		// 한 개의 Img 정보를 ImgDTO에 저장하고,
		// 여러 개의 ImgDTO를 ArrayList에 저장
		ArrayList<ImgDTO> imgList = new ArrayList<ImgDTO>();
		for(int i = 0; i < fileArr.size(); i++) {
			ImgDTO img = new ImgDTO();
			img.setImg_name(fileArr.get(i));
			img.setImg_real_name(orgFileArr.get(i));
			
			imgList.add(img);
		}
		
		
		// item 등록을 요청을 위한 ItemUploadProService의 uploadItem() 호출
		ItemUploadProService service = new ItemUploadProService();
		boolean isUploadSuccess = service.uploadItem(item, imgList, member_id, categoryDTO);
		
		if(isUploadSuccess) {
			forward = new ActionForward();
			forward.setPath("ItemMng.shop");
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('상품 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
