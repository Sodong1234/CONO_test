package action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDeleteProService;
import svc.ItemModifyProService;
import svc.MemberLoginProService;
import vo.ActionForward;
import vo.MemberDTO;

public class ItemDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String item_idx = request.getParameter("item_idx");
		
		MemberDTO member = new MemberDTO();
		member.setMember_id(request.getParameter("member_id"));
		member.setMember_pass(request.getParameter("member_pass"));
		
		MemberLoginProService service1 = new MemberLoginProService();
		boolean isMember = service1.loginMember(member);
		
		if(isMember) {
			ItemModifyProService service = new ItemModifyProService();
			ArrayList<String> imgList = service.selectImgList(item_idx);
			ItemDeleteProService service2 = new ItemDeleteProService();
			boolean isDelete = service2.deleteItem(item_idx);
			
			if(isDelete) {
				File file = null;
				for(String img : imgList) {
					file = new File("D:\\workspace_Cono\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Cono_lsy\\upload\\" + img);
					if(file.exists()) {
						file.delete();
					}
				}
				forward = new ActionForward();
				forward.setPath("ItemMng.shop");
				forward.setRedirect(true);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('상품 삭제 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 패스워드 불일치')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
