package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MypageBasketAction;
import action.MypageBasketDeleteAction;
import action.MypageCoinAction;
import action.MypageCouponAction;
import action.MypageDeleteFollowingAction;
import action.MypageDeleteProAction;
import action.MypageFollowerListAction;
import action.MypageFollowingListAction;
import action.MypageListDMAction;
import action.MypageModifyAction;
import action.MypagePassProAction;
import action.MypagePurchasedItemAction;
import action.MypageReservedItemAction;
import action.MypageWishItemAction;
import vo.ActionForward;
@WebServlet("*.mypage")
public class MypageFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
//----------------------- 마이페이지 진입 -----------------------------------
		// 마이페이지 진입을 위한 비밀번호 재확인 창으로 이동
			if (command.equals("/MypagePass.mypage")) {	
				forward = new ActionForward();
				forward.setPath("./member/memberCheck.jsp");
				forward.setRedirect(false);
				
				// 마이페이지 진입을 위한 비밀번호 재확인
			} else if (command.equals("/MypagePassPro.mypage")) {
				action = new MypagePassProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		// 마이페이지
			} else if(command.equals("/Mypage.mypage")) {
			forward = new ActionForward();
			forward.setPath("./mypage/mypage.jsp");
			forward.setRedirect(false);
			
//----------------------- 마이페이지 진입 -----------------------------------
			
//--------------------------팔로우 시작 - 최가준------------------------------------
		// 팔로잉 & 팔로워
		} else if(command.equals("/MypageListFollow.mypage")) {
			forward = new ActionForward();
			forward.setPath("./mypage/mypageList_follow.jsp");
			forward.setRedirect(false);
			
		// 팔로잉 리스트
		} else if(command.equals("/MypageFollowingList.mypage")) {
			action = new MypageFollowingListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// 팔로워 리스트
		} else if(command.equals("/MypageFollowerList.mypage")) {
			action = new MypageFollowerListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// 팔로잉 리스트
		}   else if(command.equals("/MypageFollowingList.mypage")) {
			action = new MypageFollowingListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		// 팔로잉 취소
		} else if(command.equals("/MypageDeleteFollowing.mypage")) {
				action = new MypageDeleteFollowingAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		// 팔로워 차단
		// 팔로잉 검색
		// 팔로워 검색
//--------------------------팔로우 끝 - 최가준------------------------------------
//--------------------------메시지 시작 - 최가준 ---------------------------------
		} else if(command.equals("/MypageList_dm.mypage")) {
			action = new MypageListDMAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
//--------------------------메시지 시작 - 최가준 ---------------------------------	

			
			
//--------------------------계좌조회 시작 - 최가준 ---------------------------------	

		} else if(command.equals("/MypageList_account.mypage")) {
			forward = new ActionForward();
			forward.setPath("./mypage/mypageList_account.jsp");
			forward.setRedirect(false);


//------------------------- 계좌조회 끝 - 최가준 ----------------------------------	
						
			
//------------------------- 코인 시작 - 최가준 ----------------------------------	
			
		} else if(command.equals("/Mypage_coin.mypage")) {
			action = new MypageCoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//------------------------- 코인 끝 - 최가준 ------------------------------------
//------------------------- 예약 중인 상품 시작 - 최가준 ------------------------------------
		} else if(command.equals("/Mypage_reservedItem.mypage")) {
			action = new MypageReservedItemAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//------------------------- 예약 중인 상품 끝 - 최가준 ------------------------------------
//------------------------- 구매완료 (시작) - 최가준 ------------------------------------
		} else if(command.equals("/Mypage_purchasedItem.mypage")) {
			action = new MypagePurchasedItemAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//------------------------- 구매완료 (끝) - 최가준 --------------------------------------
//------------------------- 장바구니 (시작) - 최가준 ------------------------------------
			// 장바구니 리스트
		} else if(command.equals("/Mypage_basket.mypage")) {
			action = new MypageBasketAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 장바구니 삭제
		} else if(command.equals("/MypageBasketDelete.mypage")) {
			action = new MypageBasketDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
//------------------------- 장바구니 (끝) - 최가준 --------------------------------------
//------------------------- 찜한 상품 (시작) - 최가준 ------------------------------------
		} else if(command.equals("/Mypage_wishItem.mypage")) {
			action = new MypageWishItemAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//------------------------- 찜한 상품 (끝) - 최가준 --------------------------------------
//------------------------- 쿠폰 (시작) - 최가준 ------------------------------------
		} else if (command.equals("/Mypage_coupon.mypage")) {
			action = new MypageCouponAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
//------------------------- 쿠폰 (끝) - 최가준 --------------------------------------

//-------------------------------회원 정보 시작 ------------------------------
			// 회원 탈퇴 창으로 이동
		} else if (command.equals("/MypageDelete.mypage")) {
		forward = new ActionForward();
		forward.setPath("./mypage/mypageList_deleteId.jsp");
		forward.setRedirect(false);

		// 회원 탈퇴
	} else if (command.equals("/MypageDeletePro.mypage")) {
		action = new MypageDeleteProAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 회원정보 목록 이동
	} else if (command.equals("/Mypageinfo.mypage")) {
		forward = new ActionForward();
		forward.setPath("./mypage/mypageList_modifyId.jsp");
		forward.setRedirect(false);
	}	
			
		// 회원정보 수정
	else if (command.equals("/MypageModify.mypage")) {
		action = new MypageModifyAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
//-------------------------------회원 정보 끝 ------------------------------
			// 나의 후기 창으로 이동
	else if (command.equals("/MypageReview.mypage")) {
		forward = new ActionForward();
		forward.setPath("./mypage/mypageList_myReview.jsp");
		forward.setRedirect(false);
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
