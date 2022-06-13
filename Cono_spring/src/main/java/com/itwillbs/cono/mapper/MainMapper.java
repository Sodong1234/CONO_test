package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;

public interface MainMapper {

	MemberDTO checkMember(MemberDTO member);

	int insertMember(MemberDTO member);

	void insertJoinCoupon(String member_id);

	List<HashMap<String, String>> selectCardList(String searchText);

	List<HashMap<String, String>> selectCategoryCardList(String cgr);

	void insertShopInfo(@Param("member_id") String member_id,@Param("member_nick") String member_nick);

	// 실시간 인기상품
	public List<ItemDTO> selectHotItemList();


}
