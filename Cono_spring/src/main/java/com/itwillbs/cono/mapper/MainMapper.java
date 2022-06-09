package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import com.itwillbs.cono.vo.MemberDTO;

public interface MainMapper {

	MemberDTO checkMember(MemberDTO member);

	int insertMember(MemberDTO member);

	void insertJoinCoupon(String member_id);

	List<HashMap<String, String>> selectCardList(String searchText);

	List<HashMap<String, String>> selectCategoryCardList(String cgr);


}
