package com.itwillbs.cono.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.AdminNoticeDTO;
import com.itwillbs.cono.vo.PageInfo;

public interface AdminMapper {

	public int selectNoticeListCount(@Param("searchType") String searchType, @Param("search") String search);

	public List<AdminNoticeDTO> selectNoticeList(@Param("searchType") String searchType,@Param("search") String search, @Param("pageInfo")PageInfo pageInfo);

}
