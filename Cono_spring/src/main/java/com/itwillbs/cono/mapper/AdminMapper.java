package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.AdminNoticeDTO;
import com.itwillbs.cono.vo.AdminQNADTO;
import com.itwillbs.cono.vo.PageInfo;

public interface AdminMapper {

	// 공지사항 총 게시물 수 카운트
	public int selectNoticeListCount(@Param("searchType") String searchType, @Param("search") String search);

	// 공지사항 목록
	public List<AdminNoticeDTO> selectNoticeList(@Param("searchType") String searchType,@Param("search") String search, @Param("pageInfo")PageInfo pageInfo);

	// 공지사항 글쓰기
	public int insertNotice(AdminNoticeDTO noticeList);

	// 공지사항 상세페이지
	public AdminNoticeDTO selectNoticeView(String notice_idx);

	// 공지사항 삭제
	public boolean deleteNoticeList(AdminNoticeDTO noticeList);

	// 공지사항 수정
	public boolean updateNotice(AdminNoticeDTO noticeList);

	//-----------------------qna-------------------------------------------------------
	// qna 총 게시물 수 카운트
	public int selectQNAListCount();

	// qna 목록
	public List<AdminQNADTO> selectQNAList(@Param("pageInfo")PageInfo pageInfo);

	// qna 글쓰기
	public String selectQNANumDate();
	public int insertQNA(AdminQNADTO qnaList,String num,String sId);
//
//	// qna 상세페이지
//	public AdminQNADTO selectQNAView(String qna_idx);
//
//	// qna 삭제
//	public boolean deleteQNAList(AdminQNADTO qnaList);
//
//	// qna 수정
//	public boolean updateQNA(AdminQNADTO qnaList);

	
}
