package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MainMapper;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;

@Service
public class MainService {
	
	@Autowired
	MainMapper mapper;
	
	public MemberDTO loginMember(MemberDTO member) {
		return mapper.checkMember(member);
	}

	public int joinMember(MemberDTO member) {
		return mapper.insertMember(member);
	}

	public void joinCoupon(String member_id) {
		mapper.insertJoinCoupon(member_id);
	}

	public List<HashMap<String, String>> getCardList(String searchText) {
		return mapper.selectCardList(searchText);
	}

	public List<HashMap<String, String>> getCategoryCardList(String cgr) {
		return mapper.selectCategoryCardList(cgr);
	}

	public void setShopInfo(String member_id, String member_nick) {
		mapper.insertShopInfo(member_id, member_nick);
	}

	// 실시간 인기상품 - 김혜은
	public List<ItemDTO> getHotItemList() {
		
		return mapper.selectHotItemList();
	}

}
