package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

public interface MainMapper {

	MemberDTO checkMember(MemberDTO member);

	int insertMember(MemberDTO member);

	void insertJoinCoupon(String member_id);

	List<HashMap<String, String>> selectCardList(String searchText);

	List<HashMap<String, String>> selectCategoryCardList(String cgr);

	void insertShopInfo(@Param("member_id") String member_id,@Param("member_nick") String member_nick);

	// 실시간 인기상품
	public List<ItemDTO> selectHotItemList();
	// 최근 상품 조회
	public List<HashMap<String, String>> selectRecent(String sId);
	// 가격대별 조회
	List<HashMap<String, String>> selectPriceList(@Param("filter1") String filter1,@Param("filter2") String filter2,@Param("searchText") String searchText, @Param("pageInfo")PageInfo pageInfo);

	int selectCardListCount(@Param("filter1") String filter1,@Param("filter2") String filter2,@Param("searchText") String searchText);


}
