package com.itwillbs.cono.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
			System.out.println(saveDir);
			//위에서 설정한 경로의 폴더가 없을 경우 생성
	        File dir = new File(saveDir);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
			
			// 파일 업로드
			for(MultipartFile f : upload) {
				ImgDTO img = new ImgDTO();
				if(!f.isEmpty()) {
					// 기존 파일 이름을 받고 확장자 저장
					String orifileName = f.getOriginalFilename();
					String ext = orifileName.substring(orifileName.lastIndexOf("."));
					
					 // 이름 값 변경을 위한 설정
	                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
	                int rand = (int)(Math.random()*1000);
	                
	                // 파일 이름 변경
	                String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
	                img.setImg_name(reName);
	                
	                // img 테이블 img_idx 조회
	                Integer img_idx = mapper.selectImgIdx(item) + 1;
	                img.setImg_idx(img_idx.toString());  
	                
	                // img 테이블 insert
	    			mapper.insertImg(img, item);
	                
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

	public List<HashMap<String, String>> selectItemList(String member_id, String keyword, String sell_status) {
		
		List<HashMap<String, String>> itemList = null;
		
		if(keyword == null) {
			keyword = "%%";
		} else {
			keyword = "%" + keyword + "%";
		}
		
		if(sell_status == null) {
			sell_status = "%%";
		}
		itemList = mapper.selectItemList(member_id, keyword, sell_status);
		
		
		return itemList;
	}
	
}
