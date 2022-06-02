package com.itwillbs.cono.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.mapper.ShopMapper;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.ShopDTO;

@Service
public class ShopService {
	
	@Autowired
	ShopMapper mapper;
	
	// 상점 정보 조회
	public ShopDTO getMyShop(String member_id) {
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
	
	public int[] uploadItem(ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, String member_id) {
		int insertCount[] = new int[2];
		
		// 등록된 상품 개수 조회
		int item_idx = 1;
		if(mapper.selectItemIdx() != 0) {
			item_idx = mapper.selectItemIdx() + 1;
		}
		item.setItem_idx(item_idx + "");
		
		// item 테이블 insert
//		insertCount[0] = mapper.insertItem(item, member_id);
		
		// category 테이블 insert
//		insertCount[1] = mapper.insertCategory(category, item);
		
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
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				 // 이름 값 변경을 위한 설정
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
                int rand = (int)(Math.random()*1000);
                
                // 파일 이름 변경
                String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
                
                System.out.println("rename : " + reName);
                
		        // 파일 저장
//		        try {
//		            f.transferTo(new File(saveDir + "/" + reName));
//		        }catch (IllegalStateException | IOException e) {
//		            e.printStackTrace();
//		        }
          }
      }
		
		return insertCount;
	}

}
