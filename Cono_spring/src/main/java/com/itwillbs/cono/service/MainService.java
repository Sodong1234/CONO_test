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

}
