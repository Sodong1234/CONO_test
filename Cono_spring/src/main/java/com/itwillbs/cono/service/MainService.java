package com.itwillbs.cono.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MainMapper;
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

}
