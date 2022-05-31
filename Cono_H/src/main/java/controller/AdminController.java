package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminMemberListAction;
import action.AdminNoticeDeleteProAction;
import action.AdminNoticeListAction;
import action.AdminNoticeModifyFormAction;
import action.AdminNoticeModifyProAction;
import action.AdminNoticeSearchAction;
import action.AdminNoticeViewAction;
import action.AdminNoticeWriteProAction;
import action.AdminQNADeleteProAction;
import action.AdminQNAListAction;
import action.AdminQNAModifyFormAction;
import action.AdminQNAModifyProAction;
import action.AdminQNAReplyFormAction;
import action.AdminQNAReplyProAction;
import action.AdminQNASearchAction;
import action.AdminQNAViewAction;
import action.AdminQNAWriteProAction;
import action.MemberExitAction;
import vo.ActionForward;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdminFrontController");

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		System.out.println("command : " + command);
		command = "/" + command.split("/")[2];
		Action action = null;
		ActionForward forward = null;

		// 공지사항 리스트
		if (command.equals("/AdminNoticeList.admin")) {
			action = new AdminNoticeListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 공지사항 글쓰기 페이지
		} else if (command.equals("/AdminWriteForm.admin")) {
			forward = new ActionForward();
			forward.setPath("admin_notice_write.jsp");
			forward.setRedirect(false); // Dispatcher 방식(생략 가능)

			// 공지사항 글쓰기
		} else if (command.equals("/AdminNoticeWritePro.admin")) {
			action = new AdminNoticeWriteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 공지사항 상세페이지
		} else if (command.equals("/AdminNoticeView.admin")) {
			// 비즈니스 로직 처리를 위해 BoardDetailAction 클래스의 execute() 메서드 호출
			action = new AdminNoticeViewAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 공지사항 글 삭제
		} else if (command.equals("/AdminNoticeDeletePro.admin")) {
			// 비즈니스 로직 처리를 위해 BoardListAction 클래스의 execute() 메서드 호출
			action = new AdminNoticeDeleteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 공지사항 글 수정 페이지
		} else if (command.equals("/AdminNoticeModifyForm.admin")) {
			action = new AdminNoticeModifyFormAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 공지사항 글 수정
		} else if (command.equals("/AdminNoticeModifyPro.admin")) {
			action = new AdminNoticeModifyProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 공지사항 검색
		} else if (command.equals("/AdminNoticeSearch.admin")) {
			action = new AdminNoticeSearchAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 리스트 //------------------------------------------------------------
		} else if (command.equals("/AdminQNAList.admin")) {
			action = new AdminQNAListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 글쓰기 페이지
		} else if (command.equals("/AdminQNAWriteForm.admin")) {
			forward = new ActionForward();
			forward.setPath("admin_qna_write.jsp");
			forward.setRedirect(false); // Dispatcher 방식(생략 가능)

			// 1대1 QNA 글쓰기
		} else if (command.equals("/AdminQNAWritePro.admin")) {
			action = new AdminQNAWriteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 상세페이지
		} else if (command.equals("/AdminQNAView.admin")) {
			action = new AdminQNAViewAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 글 삭제
		} else if (command.equals("/AdminQNADeletePro.admin")) {
			action = new AdminQNADeleteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 글 수정 페이지
		} else if (command.equals("/AdminQNAModifyForm.admin")) {
			action = new AdminQNAModifyFormAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 글 수정
		} else if (command.equals("/AdminQNAModifyPro.admin")) {
			action = new AdminQNAModifyProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 1대1 QNA 검색
		} else if (command.equals("/AdminQNASearch.admin")) {
			action = new AdminQNASearchAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 1대1 qna 답변 글쓰기 페이지
		} else if (command.equals("/AdminQNAReplyForm.admin")) {
			action = new AdminQNAReplyFormAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			// 1대1 qna 답변 글쓰기
		} else if (command.equals("/AdminQNAReplyPro.admin")) {
			action = new AdminQNAReplyProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ======================================================================================================================================
		} else if (command.equals("/AdminMemberList.admin")) {
			action = new AdminMemberListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemeberExit.admin")) {
			action = new MemberExitAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ==============================================================================================

		if (forward != null) { // ActionForward 객체가 비어있지 않을 경우
			if (forward.isRedirect()) { // Redirect 방식
				response.sendRedirect(forward.getPath());
			} else { // Dispatcher 방식
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {
			System.out.println("ActionForward 객체가 null 입니다!");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
