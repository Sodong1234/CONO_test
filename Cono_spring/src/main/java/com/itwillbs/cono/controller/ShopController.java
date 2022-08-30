package com.itwillbs.cono.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.service.ShopService;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.FollowDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.ShopDTO;
import com.itwillbs.cono.vo.WishDTO;

@Controller
public class ShopController {
	
	@Autowired
	ShopService service;
	
	// ---------------------- 내 상점 조회 - 문현진 ----------------------------
	@RequestMapping(value = "/ProductMyshop.shop", method = RequestMethod.GET)
	public String myShop(HttpSession session, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
		// 상점 정보 조회
		HashMap<String, String> myShop = service.getMyShop(member_id);
		
		myShop.put("member_date", myShop.get("member_date").substring(0, 4) + "." + myShop.get("member_date").substring(4, 6) + "." + myShop.get("member_date").substring(6));
		
		String[] myShopCountInfo = new String[2];
		
		// 상점 판매 횟수 조회
		myShopCountInfo[0] = service.getShopSellCnt(member_id);
		// 상점 상품 개수 조회
		myShopCountInfo[1] = service.getShopItemCnt(member_id);
		// 별점 조회
		HashMap<String, String> itemAvg = service.selectItemAvg(member_id);
		// 팔로워 수 조회
		int followCount = service.getFollowCount(member_id);
		
		model.addAttribute("itemAvg", itemAvg);
		model.addAttribute("myShop", myShop);
		model.addAttribute("myShopCountInfo", myShopCountInfo);
		model.addAttribute("followCount", followCount);
		
		return "myshop/my_page";
	}
	
	// ---------------------- 상품 등록 페이지 이동 - 이소영  ------------------
	@RequestMapping(value = "/ItemUploadForm.shop", method = RequestMethod.GET)
	public String uploadItem(HttpSession session) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
		return "myshop/item_upload";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 등록 비즈니스 로직 - 이소영  ------------------
	@RequestMapping(value = "/ItemUploadPro.shop", method = RequestMethod.POST)
	public String uploadItemPost(@ModelAttribute ItemDTO item, @ModelAttribute CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, HttpSession session, Model model) {
        
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
        boolean isUploadSuccess = service.uploadItem(item, category, upload, request, member_id);
        
        if(!isUploadSuccess) {
        	model.addAttribute("msg", "상품 등록 실패");
        	return "fail_back";
        }
        
		return "redirect:/ItemMng.shop";
	}
	// -------------------------------------------------------------------------
	
	// ------------------------- 상품 조회(리스트) - 이소영 --------------------
	@RequestMapping(value = "/ItemMng.shop", method = RequestMethod.GET)
	public String selectItemList(String keyword, String sell_status, HttpSession session, HttpServletRequest request, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
		int pageNum = 1;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int listCount = service.getItemLIstCount(member_id);
		int listLimit = 10; // 한 페이지 당 표시할 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		List<HashMap<String, String>> itemList = service.selectItemList(member_id, keyword, sell_status, pageInfo);
		for(HashMap<String, String> item : itemList) {
			item.put("item_date", item.get("item_date").substring(0,4) + "." + item.get("item_date").substring(4,6) + "." + item.get("item_date").substring(6,8)
					+ " " + item.get("item_date").substring(8, 10) + ":" + item.get("item_date").substring(10, 12) + ":" + item.get("item_date").substring(12));
		}
		model.addAttribute("itemList", itemList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sell_status", sell_status);
		model.addAttribute("pageInfo", pageInfo);
		
		return "myshop/item_mng";
	}
	// -------------------------------------------------------------------------
	
	// --------------------- 상품 숨김 기능 - 이소영 ---------------------------
	@RequestMapping(value = "/ItemHide.shop", method = RequestMethod.GET)
	public String hideItem(String item_idx, String item_hide, Model model) {
		
		int updateCount = service.updateItemHide(item_idx, item_hide);
		
		if(updateCount > 0) {
			return "redirect:/ItemMng.shop";
		} else {
			model.addAttribute("msg", "상품 숨김 실패");
        	return "redirect:/fail_back";
		}
		
	}
	// -------------------------------------------------------------------------
		
	// ----------------------- 상품 상세 정보 조회 - 이소영 --------------------
	@RequestMapping(value = "/ItemDetail.shop", method = RequestMethod.GET)
	public String selectItemDetail(String item_idx, Model model, HttpServletRequest request, HttpSession session) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
		// 상품 상세 정보 조회
		HashMap<String, String> itemDetail = service.selectItemDetail(item_idx); 
		
		itemDetail.put("item_date", itemDetail.get("item_date").substring(0,4) + "." + itemDetail.get("item_date").substring(4,6) + "." + itemDetail.get("item_date").substring(6,8)
				+ " " + itemDetail.get("item_date").substring(8, 10) + ":" + itemDetail.get("item_date").substring(10, 12) + ":" + itemDetail.get("item_date").substring(12));
		// 상품 이미지 조회
		List<ImgDTO> imgList = service.selectImgList(item_idx);
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("imgList", imgList);
		
		return "myshop/item_detail_mng";
	}
	// -------------------------------------------------------------------------
		
	// ------------ 상품 상세 정보 수정 원본 데이터 조회 - 이소영 --------------
	@RequestMapping(value = "/ItemModifyForm.shop", method = RequestMethod.GET)
	public String modifyItem(String item_idx, Model model) {
		
		// 상품 상세 정보 조회
		HashMap<String, String> itemDetail = service.selectItemDetail(item_idx);
		
		// 상품 이미지 조회
		List<ImgDTO> imgList = service.selectImgList(item_idx);
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("imgList", imgList);
		
		
		return "myshop/item_modify";
	}
	// -------------------------------------------------------------------------
	
	// -------------- 상품 상세 정보 수정 비즈니스 로직 - 이소영 ---------------
	@RequestMapping(value = "/ItemModifyPro.shop", method = RequestMethod.POST)
	public String modifyItemPost(String item_idx, String imgStatus, ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, Model model) {
		
		item.setItem_idx(item_idx);
		service.modifyItem(imgStatus, item, category, upload, request);
		
		model.addAttribute("item_idx", item_idx);
		
		return "redirect:/ItemDetail.shop";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 삭제 페이지 이동 - 이소영 ---------------------
	@RequestMapping(value = "/ItemDelete.shop", method = RequestMethod.GET)
	public String deleteItem(String item_idx, Model model) {
		
		return "myshop/item_delete";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 삭제 비즈니스 로직 - 이소영 -------------------
	@RequestMapping(value = "/ItemDeletePro.shop", method = RequestMethod.POST)
	public String deleteItemPost(MemberDTO member, String item_idx, HttpServletRequest request, Model model) {
		String algorithm = "SHA-256";
		String result = hashing(algorithm, member.getMember_pass());
		member.setMember_pass(result);
		// 아이디, 비밀번호 확인
		MemberDTO memberResult = service.checkMember(member);
		
		if(memberResult == null) {
			model.addAttribute("msg", "아이디 또는 비밀번호 불일치");
			return "myshop/fail_back";
		}
		// 상품이 ord 테이블에 등록된 경우 삭제 방지
		if(service.isOrdered(item_idx) > 0) {
			model.addAttribute("msg", "주문 진행 중인 상품입니다");
			return "myshop/fail_back";
		}
		
		boolean isDeleteSuccess = service.deleteItem(member, item_idx, request);
		
		if(!isDeleteSuccess) {
			model.addAttribute("msg", "상품 삭제 실패");
        	return "myshop/fail_back";
		}
		return "redirect:/ItemMng.shop";
	}
	// -------------------------------------------------------------------------
	
	// ----------------------- 상품 후기 조회 - 이소영 -------------------------
	@RequestMapping(value = "/ItemReviewMng.shop", method = RequestMethod.GET)
	public String selectReview(HttpSession session, String item_idx, @RequestParam(defaultValue = "1") int imgPageNum, @RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		// 평균 평점과 후기 달린 아이템 개수 조회 
		HashMap<String, String> itemAvg = service.selectItemAvg(member_id);
		
		// 점수 별 상품 개수 조회
		HashMap<String, String> itemScore = service.selectItemScore(member_id);
		
		
		// 후기 개수 조회
		int listCount = service.selectReviewListCount(member_id);
		
		int listLimit = 5; // 한 페이지 당 표시할 목록 갯수
		int pageLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		// 후기 리스트 조회
		List<HashMap<String, String>> reviewList = service.selectReviewList(member_id, item_idx, pageInfo);
		for(HashMap<String, String> review : reviewList) {
			review.put("review_date", review.get("review_date").substring(0,4) + "." + review.get("review_date").substring(4,6) + "." +review.get("review_date").substring(6,8) + " " +
					review.get("review_date").substring(8,10) + ":" +review.get("review_date").substring(10,12) + ":" +review.get("review_date").substring(12));
		}

		// ----------------------------------------------------------------------------------
		
//		// 이미지 페이징 처리
//		PageInfo imgPageInfo = new PageInfo();
//		
//		// 페이징 처리
//		listLimit = 5;
//		pageLimit = 5;
//
//		maxPage = (int)Math.ceil((double) listCount / listLimit);
//		startPage = ((int) ((double) imgPageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
//		endPage = startPage + pageLimit - 1;
//		if (endPage > maxPage) {
//			endPage = maxPage;
//		}
//		
//		// 조회 시작 게시물 번호(행 번호) 계산
//		startRow = (imgPageNum - 1) * listLimit;
//		
//		imgPageInfo.setPageNum(imgPageNum);
//		imgPageInfo.setMaxPage(maxPage);
//		imgPageInfo.setStartPage(startPage);
//		imgPageInfo.setEndPage(endPage);
//		imgPageInfo.setListCount(listCount);
//		imgPageInfo.setStartRow(startRow);
//		imgPageInfo.setListLimit(listLimit);
//		
		// 상품 고를 때 클릭할 이미지(img_name) 조회
//		List<HashMap<String, String>> imgNameList = service.selectItemImgName(member_id, imgPageInfo);
		List<HashMap<String, String>> imgNameList = service.selectItemImgName(member_id);
		// 클릭된 이미지 조회
		if(item_idx != null) {
			String img = service.selectImg(item_idx);
			model.addAttribute("img", img);
		}
		model.addAttribute("itemAvg", itemAvg);
		model.addAttribute("itemScore", itemScore);
		model.addAttribute("imgNameList", imgNameList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageInfo);
//		model.addAttribute("imgPageInfo", imgPageInfo);
		
		return "myshop/item_review_mng";
	}
	
	// -------------------------------------------------------------------------
	
	// --------------- 내상점 수정 원본 데이터 조회 - 문현진 -------------------
	@RequestMapping(value = "/ProductMyshopModifyForm.shop", method = RequestMethod.GET)
	public String getMyShop(HttpSession session, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		// 상점 정보 조회
		HashMap<String, String> myShop = service.getMyShop(member_id);
		
		model.addAttribute("myShop", myShop);
		
		return "myshop/my_page_modify";
	}
	// -------------------------------------------------------------------------
	
	// ---------------- 내상점 수정 비즈니스 로직 - 문현진 ---------------------
	@RequestMapping(value = "/ProductMyshopModifyPro.shop", method = RequestMethod.POST)
	public String getMyShopPost(HttpSession session, HttpServletRequest request, MemberDTO member, ShopDTO shop, MultipartFile[] upload, String imgStatus, Model model) {
		
		member.setMember_id(session.getAttribute("sId").toString());
		
		String algorithm = "SHA-256";
		String result = hashing(algorithm, member.getMember_pass());
		member.setMember_pass(result);		
		
		
		MemberDTO memberResult = service.checkMember(member);
		
		if(memberResult == null) {
			model.addAttribute("msg", "비밀번호 틀림");
			return "fail_back";
		}
		
		service.modifyMyshop(request, shop, upload, member, imgStatus);
		
		return "redirect:/ProductMyshop.shop";
	}
	
	// -------------------------------------------------------------------------
	// --------------------- 상품 주문 관리(구매 진행중) - 문현진 ---------------------------
	@RequestMapping(value = "/ItemOrdMng.shop", method = RequestMethod.GET)
	public String getOrdList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
		System.out.println(pageNum);
		
		// 상품 주문(진행중) 개수 조회
		int listCount = service.selectOrdListCount(member_id);
		
		// 페이징 처리
		int listLimit = 10;
		int pageLimit = 10;

		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장(후기 리스트)
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		// 상품 주문 조회(진행중)
		List<HashMap<String, String>> ordList = service.getOrdList(member_id, pageInfo);
		
		model.addAttribute("ordList", ordList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "myshop/item_order_mng";
	}
	
	// 상품 주문관리(완료)
	@RequestMapping(value = "/ItemOrdFinishMng.shop", method = RequestMethod.GET)
	public String OrdFinishList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
		// 상품 주문(완료) 개수 조회
		int listCount = service.selectFinishOrdListCount(member_id);
				
		// 페이징 처리
		int listLimit = 10;
		int pageLimit = 10;

		int maxPage = (int)Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장(후기 리스트)
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		
		// 상품 주문 조회(완료)
		List<HashMap<String, String>> finishOrdList = service.getFinishOrdList(member_id, pageInfo);
		
		model.addAttribute("finishOrdList", finishOrdList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "myshop/item_order_finish_mng";
	}
	
	// -------------------------------------------------------------------------
	// 팔로워
	@RequestMapping(value = "follow", method = RequestMethod.GET)
	public String follower(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		String shop_idx = service.getShop_idx(sId);
		// 팔로잉 팔로워 정보 
		List<HashMap<String, String>> followerList = service.getfollowerList(shop_idx);
		// 팔로잉 팔로워 수
		int followingCount = service.getFollowingCount(sId);
		int followerCount = service.getFollowerCount(sId);
		model.addAttribute("followerList", followerList);
		model.addAttribute("followerCount", followerCount);

		return "myshop/list_follower";
	}
	
	// 팔로잉
	@RequestMapping(value = "following", method = RequestMethod.GET)
	public String following(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		// 팔로잉 팔로워 정보 
		List<HashMap<String, String>> followingList = service.getfollowingList(sId);
		// 팔로잉 팔로워 수
		int followingCount = service.getFollowingCount(sId);
		int followerCount = service.getFollowerCount(sId);
		model.addAttribute("followingList", followingList);
		model.addAttribute("followingCount", followingCount);

		return "myshop/list_following";
	}
	
	// 팔로워 취소
	@RequestMapping(value = "deleteFollowerShop", method = RequestMethod.GET)
	public String deleteFollower(String follow_shop_idx, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 상점 주인 shop_idx 가져오기
		String shop_idx = service.getShop_idx(sId);
		
		// 팔로우한 사람의 member_id 찾기
		String member_id = service.getMemberId(follow_shop_idx);
		
		int deleteCount = service.deleteFollowing(member_id, shop_idx);

		return "redirect:/follow";
	}
	// 팔로잉 취소
	@RequestMapping(value = "deleteFollowingShop", method = RequestMethod.GET)
	public String deleteFollowing(String shop_idx, HttpSession session, Model model) {

		String member_id = (String)session.getAttribute("sId");
		
		int deleteCount = service.deleteFollowing(member_id, shop_idx);

		return "redirect:/following";
	}
	
	// --------------------------- 팔로우 추가 하기 -- 김도은 ---------------------------
	
//	@RequestMapping(value = "Myshop.shop", method = RequestMethod.GET)
//	public String myshopGet (String item_idx, Model model, String shop_idx) {
//
//		// 상점 정보 조회
//		HashMap<String, String> shopInfo = service.getShop(item_idx);
//		
//		String[] shopCountInfo = new String[3];
//		
//		// 상점 판매 횟수 조회
//		shopCountInfo[0] = service.getShopSellCntBuyer(item_idx);
//		// 상점 상품 개수 조회
//		shopCountInfo[1] = service.getShopItemCntBuyer(item_idx);
//		
//		
//		// 팔로워 수 조회
//		String followerCnt = service.getFollowerCnt(item_idx);
//		
//		model.addAttribute("shopInfo", shopInfo);
//		model.addAttribute("shopCountInfo", shopCountInfo);
//		model.addAttribute("followerCnt", followerCnt);
//		model.addAttribute("item_idx", item_idx);
//		
//		return "redirect:/Myshop.shop?shop_idx=" + shop_idx;
//	}
	
	
	// 팔로우하기
	@RequestMapping(value = "plusFollow", method = RequestMethod.GET)
	public String plusFollow(HttpSession session, Model model, String shop_idx,String item_idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		int plusCount = service.plusFollow(sId, shop_idx);
		
		return "redirect:/Myshop.shop?shop_idx=" + shop_idx+"&item_idx="+item_idx;
	}
	// -------------------------------------------------------------------------
	// 언팔
	@RequestMapping(value = "deleteFollowing", method = RequestMethod.GET)
	public String deleteFollowing (HttpSession session, Model model, String shop_idx,String item_idx) {
		String sId = (String)session.getAttribute("sId");
		
		int deleteCount = service.deleteFollowing(sId, shop_idx);
		
//		return "myshop/list_following";
		
		return "redirect:/Myshop.shop?shop_idx=" + shop_idx+"&item_idx="+item_idx;
	}
 
	//============================================================ 구매자 시점의 상점 ==================================================================
	
	// 상점 이동
	@RequestMapping(value = "Myshop.shop", method = RequestMethod.GET)
	public String myshop (HttpSession session,String item_idx, Model model) {
		
		String sId = null;
		if(session.getAttribute("sId") != null) {
			sId = session.getAttribute("sId").toString(); 
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			return "./myshop/fail_back";
		}
		
		// 상점 정보 조회
		HashMap<String, String> shopInfo = service.getShop(item_idx);
		
		String[] shopCountInfo = new String[3];
		
		// 상점 판매 횟수 조회
		shopCountInfo[0] = service.getShopSellCntBuyer(item_idx);
		// 상점 상품 개수 조회
		shopCountInfo[1] = service.getShopItemCntBuyer(item_idx);
		// 별점 조회
		shopCountInfo[2] = service.getShopAvgStar(item_idx);
		// 팔로워 수 조회
		String followerCnt = service.getFollowerCnt(item_idx);
		

		// 팔로우 여부 조회
		String shop_idx = shopInfo.get("shop_idx");
		FollowDTO followList = null;
		
		if(sId != null) {
			followList = service.followList(sId,shop_idx);
		}

		
		model.addAttribute("followList", followList);
		model.addAttribute("shopInfo", shopInfo);
		model.addAttribute("shopCountInfo", shopCountInfo);
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("item_idx", item_idx);
		
		return "myshop/shop_buyer/shop";
	}
	// 상점 상품
	@RequestMapping(value = "shopProduct", method = RequestMethod.GET)
	public String showProduct (String shop_idx, Model model) {
		
		List<HashMap<String, String>> itemList = service.getItemList(shop_idx);
		
		model.addAttribute("itemList", itemList);
		
		return "myshop/shop_buyer/shop_product";
	}
	
	// 상점 후기
	@RequestMapping(value = "shopReview", method = RequestMethod.GET)
	public String showReview (@RequestParam(defaultValue = "1") int pageNum, String shop_idx, Model model) {
		// shop 주인 member_id 들고오기
		String member_id = service.getMemberId(shop_idx);
		
		// 후기 개수 조회
		int listCount = service.selectReviewListCount(member_id);
		
		// 페이징 처리
		int listLimit = 5;
		int pageLimit = 5;

		int maxPage = (int)Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장(후기 리스트)
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		// 후기 리스트 조회
		List<HashMap<String, String>> reviewList = service.selectReviewList(member_id, "%%", pageInfo);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "myshop/shop_buyer/shop_review";
	}
	
	// 상점 팔로워
	@RequestMapping(value = "shopFollower", method = RequestMethod.GET)
	public String showFollower (String shop_idx, Model model) {
		
		
		
		// 팔로워 정보 
		List<HashMap<String, String>> followerList = service.getfollowerList(shop_idx);
		
		
		model.addAttribute("followerList", followerList);
		
		return "myshop/shop_buyer/shop_follower";
	}
	
	
	
	// 상점 팔로잉
	@RequestMapping(value = "shopFollowing", method = RequestMethod.GET)
	public String showFollowing (String shop_idx, Model model) {
		
		// shop 주인 member_id 들고오기
		String sId = service.getMemberId(shop_idx);
		// 팔로잉 정보 
		List<HashMap<String, String>> followingList = service.getfollowingList(sId);
		model.addAttribute("followingList", followingList);
		return "myshop/shop_buyer/shop_following";
	}
	
	// ---------------------------------------- 비밀번호 암호화 -------------------------------------------
	private String hashing(String algorithm, String strPlaintext) {
		String strHashedData = "";
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm);
			
			byte[] byteText = strPlaintext.getBytes();
			System.out.println(Arrays.toString(byteText));
			
			md.update(byteText);
			
			byte[] digest = md.digest();
			
			for(byte b : digest) {
				strHashedData += Integer.toHexString(b & 0xFF).toUpperCase();
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("입력한 암호화 알고리즘 존재 x");
			e.printStackTrace();
		}
		System.out.println(strHashedData);
		return strHashedData;
	}
	
// -------------------------------------------------------------------------


}
