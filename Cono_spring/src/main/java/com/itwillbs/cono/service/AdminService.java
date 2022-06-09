package com.itwillbs.cono.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.AdminMapper;
import com.itwillbs.cono.vo.AdminNoticeDTO;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	
	public int getNoticeListCount(String searchType, String search) {
		return mapper.selectNoticeListCount(searchType,search);
	}


	public List<AdminNoticeDTO> getNoticeList(String searchType, String search, PageInfo pageInfo) {
		return mapper.selectNoticeList(searchType,search,pageInfo);
	}

}
