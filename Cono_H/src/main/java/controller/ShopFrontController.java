package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ItemDeleteProAction;
import action.ItemDetailAction;
import action.ItemHideAction;
import action.ItemMngAction;
import action.ItemModifyFormAction;
import action.ItemModifyProAction;
import action.ItemUploadProAction;
import action.ProductMyShopAction;
import action.ProductMyShopModifyFormAction;
import action.ProductMyShopModifyProAction;
import vo.ActionForward;

@WebServlet("*.shop")
public class ShopFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ItemFrontController");
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		// -------------------------------- 상품 등록 페이지 이동(시작) - 이소영 ---------------------------------------
		if (command.equals("/ItemUploadForm.shop")) {
		forward = new ActionForward();
		forward.setPath("myshop/item_upload.jsp");
		forward.setRedirect(false);
		// --------------------------------- 상품 등록 페이지 이동(끝) - 이소영 ----------------------------------------
		// ---------------------------------- 상품 등록 db 작업(시작) - 이소영 -----------------------------------------
		} else if(command.equals("/ItemUploadPro.shop")) {
			action = new ItemUploadProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ----------------------------------- 상품 등록 db 작업(끝) - 이소영 ------------------------------------------
		// ---------------------------------- 상품 조회(리스트) (시작) - 이소영 ----------------------------------------
		} else if (command.equals("/ItemMng.shop")) {
			action = new ItemMngAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ----------------------------------- 상품 조회(리스트) (끝) - 이소영 -----------------------------------------
		// ----------------------------------- 상품 숨김 기능 (시작) - 이소영 ------------------------------------------
		} else if (command.equals("/ItemHide.shop")) {
			action = new ItemHideAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ------------------------------------- 상품 숨김 기능 (끝) - 이소영 ------------------------------------------
		// ------------------------------------ 상품 상세 조회 (시작) - 이소영 -----------------------------------------
		} else if (command.equals("/ItemDetail.shop")) {
			action = new ItemDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ------------------------------------- 상품 상세 조회 (끝) - 이소영 ------------------------------------------
		// --------------------------- 상품 정보 수정 원본 데이터 조회 (시작) - 이소영 ---------------------------------
		} else if (command.equals("/ItemModifyForm.shop")) {
			action = new ItemModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ---------------------------- 상품 정보 수정 원본 데이터 조회 (끝) - 이소영 ----------------------------------
		// ------------------------------------ 상품 정보 수정 (시작) - 이소영 -----------------------------------------
		} else if (command.equals("/ItemModifyPro.shop")) {
			action = new ItemModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ------------------------------------- 상품 정보 수정 (끝) - 이소영 ------------------------------------------
		// --------------------------------- 상품 삭제 페이지 이동 (시작) - 이소영 -------------------------------------
		} else if (command.equals("/ItemDelete.shop")) {
			forward = new ActionForward();
			forward.setPath("myshop/item_delete.jsp");
			forward.setRedirect(false);
		// ---------------------------------- 상품 삭제 페이지 이동 (끝) - 이소영 --------------------------------------
		// --------------------------------------- 상품 삭제 (시작) - 이소영 -------------------------------------------
		} else if (command.equals("/ItemDeletePro.shop")) {
			action = new ItemDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ---------------------------------------- 상품 삭제 (끝) - 이소영 --------------------------------------------
		// ---------------------------------- 내 상점 이동 임시 (시작) - 이소영 ----------------------------------------
		} else if (command.equals("/Myshop.shop")) {
			forward = new ActionForward();
			forward.setPath("myshop/my_page.jsp");
			forward.setRedirect(false);
		}
		// ----------------------------------- 내 상점 이동 임시 (끝) - 이소영 -----------------------------------------
		
	else if(command.equals("/ProductMyshop.shop")) { //나의 상점 - 문현진
		action = new ProductMyShopAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/ProductMyshopModifyForm.shop")) { //나의 상점 수정 - 문현진
		action = new ProductMyShopModifyFormAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} else if(command.equals("/ProductMyshopModifyPro.shop")) { //나의 상점 수정 - 문현진
		action = new ProductMyShopModifyProAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
//------------------------------------ 현진
		
		if(forward != null) {	
			if(forward.isRedirect()) {  // Redirect 방식
				response.sendRedirect(forward.getPath());
			} else {	// Dispatcher 방식
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {
			System.out.println("ActionForward 객체가 null 입니다");
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

