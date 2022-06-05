package com.itwillbs.cono.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.mapper.ItemMapper;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;

@Service
public class ItemService {
	
	@Autowired
	ItemMapper mapper;
	
	public boolean uploadItem(ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, String member_id) {
		boolean isUploadSuccess = false;
		
		// 등록된 상품 개수 조회
		int item_idx = 1;
		if(mapper.selectItemIdx() != 0) {
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
	public List<HashMap<String, String>> selectItemList(String member_id, String keyword, String sell_status) {
		
		List<HashMap<String, String>> itemList = null;
		
		if(keyword != null) {
			keyword = "%" + keyword + "%";
		}
		itemList = mapper.selectItemList(member_id, keyword, sell_status);
		
		
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
	public void modifyItem(String imgStatus, ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request) {

		// String 으로 넘어온 이미지 상태를 배열로 변환
		String[] imgStatusArr = imgStatus.split("/");
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		
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
}
