package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberCenterAction;
import action.MemberFindIdAction;
import action.MemberFindPassAction;
import action.MemberHomeAction;
import action.MemberJoinProAction;
import action.MemberLoginProAction;
import action.MemberLogoutAction;
import vo.ActionForward;
	@WebServlet("*.func")
	public class MainFunction extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String command = request.getServletPath();
			System.out.println("command : " + command);
			
			Action action = null;
			ActionForward forward = null;
//----------------------회원가입 /  로그인 시작----------------------------------			
			// 헤더 - 회원가입 선택
			if(command.equals("/MemberHowJoin.func")) {
				forward = new ActionForward();
				forward.setPath("./member/howjoin.jsp");
				forward.setRedirect(false);
			// 회원가입 폼 
			} else if (command.equals("/MemberJoinForm.func")) {
				forward = new ActionForward();
				forward.setPath("./member/join.jsp");
				forward.setRedirect(false);
			// 회원가입 프로
			} else if (command.equals("/MemberJoinPro.func")) {
				action = new MemberJoinProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			// 헤더 - 로그인 창으로 이동
			} else if (command.equals("/MemberLogin.func")) {
				forward = new ActionForward();
				forward.setPath("./member/login.jsp");
				forward.setRedirect(false);
			// 헤더 - 로그인 프로
			} else if(command.equals("/MemberLoginPro.func")) {
				action = new MemberLoginProAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
				
				// 헤더 - 로그아웃
			} else if (command.equals("/MemberLogout.func")) {
				action = new MemberLogoutAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
//----------------------회원가입 / 로그인 끝----------------------------------
			
//----------------------아이디 / 비번 찾기 시작----------------------------------

				// 아이디, 비밀번호 찾기로 이동
				} else if (command.equals("/MemberForget.func")) {
					forward = new ActionForward();
					forward.setPath("./member/forget.jsp");
					forward.setRedirect(false);
				// 아이디 찾기
				} else if (command.equals("/MemberFindId.func")) {
					action = new MemberFindIdAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				// 아이디 찾기 결과창 이동
				} else if (command.equals("/MemberFindIdResult.func")) {
					forward = new ActionForward();
					forward.setPath("./member/find_id.jsp");
					forward.setRedirect(false);
				// 비밀번호 찾기
				} else if (command.equals("/MemberFindPass.func")) {
					action = new MemberFindPassAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				// 비밀번호 찾기 결과창 이동
				} else if (command.equals("/MemberFindPassResult.func")) {
					forward = new ActionForward();
					forward.setPath("./member/find_pass.jsp");
					forward.setRedirect(false);
				
				
				
				
//----------------------아이디 / 비번 찾기 끝----------------------------------
				
			// 헤더 - 고객센터 창으로 이동
			} else if (command.equals("/MemberCenter.func")) {
				action = new MemberCenterAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			// 헤더 - 홈
			} else if (command.equals("/main.func")) {
				action = new MemberHomeAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
			
			
			
			
			if(forward != null) {
				if(forward.isRedirect()) { 
					response.sendRedirect(forward.getPath());
				} else { 
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			} else {
				System.out.println("ActionForward 객체가 null 입니다!");
			}
			
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
