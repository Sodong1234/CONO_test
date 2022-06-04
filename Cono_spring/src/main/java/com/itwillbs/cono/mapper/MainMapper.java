package com.itwillbs.cono.mapper;

import com.itwillbs.cono.vo.MemberDTO;

public interface MainMapper {

	MemberDTO checkMember(MemberDTO member);

	int insertMember(MemberDTO member);

	void insertJoinCoupon(String member_id);


}
