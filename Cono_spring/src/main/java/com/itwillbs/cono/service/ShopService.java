package com.itwillbs.cono.service;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.mapper.ShopMapper;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.FollowDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.OrdDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.ShopDTO;

@Service
public class ShopService {
	
	@Autowired
	ShopMapper mapper;
	
	// 상점 정보 조회
	public HashMap<String, String> getMyShop(String member_id) {
		return mapper.selectMyShop(member_id);
	}
	
	// 상점 판매 횟수 조회
	public String getShopSellCnt(String member_id) {
		return mapper.selectShopSellCnt(member_id);
	}
	
	// 상점 상품 개수 조회
	public String getShopItemCnt(String member_id) {
		return mapper.selectShopItemCnt(member_id);
	}
	
	public boolean uploadItem(ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, String member_id) {
		boolean isUploadSuccess = false;
		
		// 등록된 상품 개수 조회
		int item_idx = 1;
		if(mapper.selectItemIdx() != null) {
			item_idx = mapper.selectItemIdx() + 1;
		}
		item.setItem_idx(item_idx + "");
		
		int[] insertCount = new int[3];
		
		// item 테이블 insert
		insertCount[0] = mapper.insertItem(item, member_id);
		
		// category 테이블 insert
		insertCount[1] = mapper.insertCategory(category, item);
		
		if(insertCount[0] > 0 && insertCount[1] > 0) {
			// 파일이 업로드 될 경로 설정
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
			//위에서 설정한 경로의 폴더가 없을 경우 생성
	        File dir = new File(saveDir);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
			
	        for(int i = 0; i < upload.length; i++) {
	        	ImgDTO img = new ImgDTO();
	        	MultipartFile f = upload[i];
	        	if(f.isEmpty()) {
	        		img.setImg_idx((i+1) + "");
	        		img.setImg_real_name(null);
	        		img.setImg_name(null);
	        		
	        		mapper.insertImgList(img, item);
	        	} else {
	        		img.setImg_idx((i+1) + "");
	        		// 기존 파일 이름을 받고 확장자 저장
					String orifileName = f.getOriginalFilename();
					String ext = orifileName.substring(orifileName.lastIndexOf("."));
					img.setImg_real_name(orifileName);
					
					 // 이름 값 변경을 위한 설정
	                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	                String uuid = UUID.randomUUID().toString();
	                
	                // 파일 이름 변경
	                String reName = sdf.format(System.currentTimeMillis()) + "_" + uuid + ext;
	                img.setImg_name(reName);
	                
	                // img 테이블 insert
	    			mapper.insertImgList(img, item);
	                
			        // 파일 저장
			        try {
			            f.transferTo(new File(saveDir + "/" + reName));
			        }catch (IllegalStateException | IOException e) {
			            e.printStackTrace();
			        }
	        	}
	        }
	        
			isUploadSuccess = true;
		}
		return isUploadSuccess;
	}
	// 상품 관리 (상품 리스트 조회)
	public List<HashMap<String, String>> selectItemList(String member_id, String keyword, String sell_status, PageInfo pageInfo) {
		
		List<HashMap<String, String>> itemList = null;
		
		if(keyword != null) {
			keyword = "%" + keyword + "%";
		}
		itemList = mapper.selectItemList(member_id, keyword, sell_status, pageInfo);
		
		
		return itemList;
	}

	// 상품 숨김 기능
	public int updateItemHide(String item_idx, String item_hide) {
		
		if(item_hide.equals("N")) {
			item_hide = "Y";
		} else if(item_hide.equals("Y")) {
			item_hide = "N";
		}
		
		return mapper.updateItemHide(item_idx, item_hide);
	}
	
	// 상품 상세 정보 조회
	public HashMap<String, String> selectItemDetail(String item_idx) {
		return mapper.selectItemDetail(item_idx);
	}
	
	// 상품 이미지 조회
	public List<ImgDTO> selectImgList(String item_idx) {
		return mapper.selectImgList(item_idx);
	}
	
	// 상품 정보 수정
	public void modifyItem(String imgStatus, ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request) {

		// String 으로 넘어온 이미지 상태를 배열로 변환
		String[] imgStatusArr = imgStatus.split("/");
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		
		// item 수정
		mapper.updateItem(item);
		
		// category 수정
		mapper.updateCategory(category, item);
		
		// 원본 이미지리스트 조회
		List<ImgDTO> orgImgList = mapper.selectImgList(item.getItem_idx());
		for(int i = 0; i < imgStatusArr.length; i++) {
			
			ImgDTO img = new ImgDTO();
			MultipartFile f = upload[i];
			String reName = "";
			
			if(!f.isEmpty()) {
				img.setImg_idx((i+1) + "");
				
				// 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				img.setImg_real_name(orifileName);
				
				 // 이름 값 변경을 위한 설정
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                String uuid = UUID.randomUUID().toString();
                
                // 파일 이름 변경
                reName = sdf.format(System.currentTimeMillis()) + "_" + uuid + ext;
                img.setImg_name(reName);
			} else {
				img.setImg_idx((i+1) + "");
				img.setImg_real_name(null);
				img.setImg_name(null);
			}
			// 원본 이미지가 있고, 수정된 이미지 상태가 N(없음)일 경우 원본 이미지 삭제 작업 진행
			if(imgStatusArr[i].equals("N") && orgImgList.get(i).getImg_name() != null) {
				
				mapper.updateImg(item, img, orgImgList.get(i).getImg_idx());
				
				File file = new File(saveDir + "\\" + orgImgList.get(i).getImg_name());
				if(file.exists()) {
					file.delete();
				}
				
			// 원본 이미지가 있고, 수정된 이미지 상태가 Y(있음)일 경우 이미지 수정 작업 진행
            } else if(imgStatusArr[i].equals("Y") && orgImgList.get(i).getImg_name() != null) {
            	
            	if(img.getImg_real_name() != null) {
            		mapper.updateImg(item, img, orgImgList.get(i).getImg_idx());
            		
            		File file = new File(saveDir + "/" + orgImgList.get(i).getImg_name());
            		if(file.exists()) {
            			file.delete();
            		}
            		try {
            			f.transferTo(new File(saveDir + "/" + reName));
            		}catch (IllegalStateException | IOException e) {
            			e.printStackTrace();
            		}
            	}
				
			// 원본 이미지가 없고, 수정된 이미지 상태가 Y(있음)일 경우 이미지 추가 작업 진행
            } else if(imgStatusArr[i].equals("Y") && orgImgList.get(i).getImg_name() == null) {
            	
            	mapper.updateImg(item, img, orgImgList.get(i).getImg_idx());
            	
				try {
		            f.transferTo(new File(saveDir + "/" + reName));
		        }catch (IllegalStateException | IOException e) {
		            e.printStackTrace();
		        }
            }
		}
	}
	
	// 상품이 ord 테이블에 등록된 경우 삭제 방지
	public int isOrdered(String item_idx) {
		return mapper.isOrdered(item_idx);
	}
	
	
	// 상품 삭제
	public boolean deleteItem(MemberDTO member, String item_idx, HttpServletRequest request) {
		boolean isDeleteSuccess = false;
		
		int[] deleteCount = new int[3];
		
		List<ImgDTO> imgList = mapper.selectImgList(item_idx);
		
		deleteCount[0] = mapper.deleteItem(member, item_idx);
		
		deleteCount[1] = mapper.deleteImg(item_idx);
		
		deleteCount[2] = mapper.deleteCategory(item_idx);
		
		for(int cnt : deleteCount) {
			if(cnt == 0) {
				break;
			}
			isDeleteSuccess = true;
		}
		
		if(isDeleteSuccess) {
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
			for(int i = 0; i < imgList.size(); i++) {
				File file = new File(saveDir + "/" + imgList.get(i).getImg_name());
				if(file.exists()) {
					file.delete();
				}
			}
		}
		
		return isDeleteSuccess;
	}

	// 상점 수정 회원 확인
	public MemberDTO checkMember(MemberDTO member) {
		return mapper.selectMember(member);
	}

	// 상점 정보 수정
	public void modifyMyshop(HttpServletRequest request, ShopDTO shop, MultipartFile[] upload, MemberDTO member, String imgStatus) {
        
		// 상점 원본 이미지 가져오기
		HashMap<String, String> orgShopImg = mapper.selectMyShop(member.getMember_id());
		
		// 상점 이미지 저장 경로 
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/shopImg");
		
		File dir = new File(saveDir);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        
		MultipartFile f = upload[0];
		// 전달 받은 파일이 없을 경우
		System.out.println(f.isEmpty());
		System.out.println(shop.getShop_img());
		if(f.isEmpty()) {
			// 원본 이미지가 있을 경우
			if(orgShopImg.get("shop_img") != null) {
				shop.setShop_img(orgShopImg.get("shop_img"));
			}
			
		// 전달 받은 파일이 있을 경우
		} else {
			String oriFileName = f.getOriginalFilename();	// 파일 실제 이름
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));	// 파일 확장자
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String reName = shop.getShop_idx() + "_" + sdf.format(System.currentTimeMillis()) + ext;	// => 1_20200202.png
			shop.setShop_img(reName);
			
			
			// 원본 이미지가 있을 경우
			if(orgShopImg.get("shop_img") != null) {
				File file = new File(saveDir + "\\" + orgShopImg.get("shop_img"));
	    		if(file.exists()) {
	    			file.delete(); // 원본 이미지 파일 삭제
	    		}
	    		try {
	    			f.transferTo(new File(saveDir + "\\" + reName));	// 전달 받은 이미지 파일 저장
	    		}catch (IllegalStateException | IOException e) {
	    			e.printStackTrace();
	    		}
	    	// 원본 이미지가 없을 경우
			} else {
				try {
					f.transferTo(new File(saveDir + "\\" + reName));	// 전달 받은 이미지 저장
	    		}catch (IllegalStateException | IOException e) {
	    			e.printStackTrace();
	    		}
			}
		}
		
		mapper.updateMyshop(shop);
	}
	
	// 상품 평균 평점과 후기 달린 아이템의 개수 조회
	public HashMap<String, String> selectItemAvg(String member_id) {
		return mapper.selectItemAvg(member_id);
	}

	// 점수 별 상품 개수 조회
	public HashMap<String, String> selectItemScore(String member_id) {
		HashMap<String, String> itemScore = new HashMap<String, String>();
		for(int i = 1; i < 6; i++) {
			
			itemScore.put(i+"", mapper.selectItemScore(member_id, i+""));
		}
		return itemScore;
	}	
	
	//상품 고를 때 클릭할 이미지 조회
//	public List<HashMap<String, String>> selectItemImgName(String member_id, PageInfo imgPageInfo) {
//		return mapper.selectItemImgName(member_id, imgPageInfo);
//	}
	public List<HashMap<String, String>> selectItemImgName(String member_id) {
		return mapper.selectItemImgName(member_id);
	}

	// 후기 개수 조회
	public int selectReviewListCount(String member_id) {
		return mapper.selectReviewListCount(member_id);
	}
	
	// 후기 리스트 조회
//	public List<HashMap<String, String>> selectReviewList(String member_id, String item_idx, PageInfo pageInfo) {
//		return mapper.selectReviewList(member_id, item_idx, pageInfo);
//	}
	public List<HashMap<String, String>> selectReviewList(String member_id, String item_idx, PageInfo pageInfo) {
		return mapper.selectReviewList(member_id, item_idx, pageInfo);
	}
	
	// 클릭된 이미지 조회
	public String selectImg(String item_idx) {
		return mapper.selectImg(item_idx);
	}

	// 상품 주문(진행중) 개수 조회
	public int selectOrdListCount(String member_id) {
		return mapper.selectOrdListCount(member_id);
	}

	// 상품 주문 (진행중) 리스트 조회
	public List<HashMap<String, String>> getOrdList(String member_id, PageInfo pageInfo) {
		return mapper.selectOrdList(member_id, pageInfo);
	}
	
	// 상품 주문(완료) 개수 조회
	public int selectFinishOrdListCount(String member_id) {
		return mapper.selectFinishOrdListCount(member_id);
	}

	// 상품 주문 (완료) 리스트 조회
	public List<HashMap<String, String>> getFinishOrdList(String member_id, PageInfo pageInfo) {
		return mapper.selectFinishOrdList(member_id, pageInfo);
	}
	
	// 상품 조회 (페이징 처리를 위한 ListCount 조회)
	public Integer getItemLIstCount(String member_id) {
		return mapper.selectItemListCount(member_id);
	}
	
	// 팔로잉 리스트
	public List<HashMap<String, String>> getfollowingList(String sId) {
		return mapper.selectFollowingList(sId);
	}
	// 팔로워 리스트
	public List<HashMap<String, String>> getfollowerList(String shop_idx) {
		return mapper.selectFollowerList(shop_idx);
	}
	// 팔로잉 수
	public int getFollowingCount(String sId) {
		return mapper.selectFollowingCount(sId);
	}
	// 팔로워 수
	public int getFollowerCount(String sId) {
		return mapper.selectFollowerCount(sId);
	}
	
	// 팔로우 추가 (김도은)
	public int plusFollow(String sId, String shop_idx) {
		return mapper.insertFollow(sId, shop_idx);
		 
	}
	// 팔로잉 삭제
	public int deleteFollowing(String sId, String shop_idx) {
		return mapper.deleteFollowing(sId, shop_idx);
	}
	
	// 후기 이미지 개수 조회
	public int selectReviewImgListCount(String member_id) {
		return mapper.selectReviewImgListCount(member_id);
	}

	// ==========================================================================================
	
	// 상점 조회
	public HashMap<String, String> getShop(String item_idx) {
		return mapper.selectShop(item_idx);
	}
	
	// 판매 횟수 조회
	public String getShopSellCntBuyer(String item_idx) {
		return mapper.selectShopSellCntBuyer(item_idx);
	}
	
	// 상품 회수 조회
	public String getShopItemCntBuyer(String item_idx) {
		return mapper.selectShopItemCntBuyer(item_idx);
	}
	
	// 팔로워 수 조회
	public String getFollowerCnt(String item_idx) {
		return mapper.selectFollowerCnt(item_idx);
	}
	
	// 상점 상품 조회
	public List<HashMap<String, String>> getItemList(String shop_idx) {
		return mapper.selectItemListBuyer(shop_idx);
	}
	
	// shop 주인 member_id 들고오기
	public String getMemberId(String shop_idx) {
		return mapper.selectMemberId(shop_idx);
	}

	public int selectItemOrd(String item_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	public FollowDTO followList(String sId) {
		return mapper.selectFollow(sId);
	}

	

	
	
	
	

}
