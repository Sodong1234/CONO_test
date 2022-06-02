package com.itwillbs.cono.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MypageMapper;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
	
	// 1. 최근 조회 게시물 수
	public int getRecentViewListCount() {
		return mapper.selectRecentViewCount();
	}

}
