package com.itwillbs.cono.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.AdminMapper;
import com.itwillbs.cono.vo.AdminNoticeDTO;
import com.itwillbs.cono.vo.AdminQNADTO;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 공지사항 총게시물수 카운트
	public int getNoticeListCount(String searchType, String search) {
		return mapper.selectNoticeListCount(searchType,search);
	}

	// 공지사항 목록+검색
	public List<AdminNoticeDTO> getNoticeList(String searchType, String search, PageInfo pageInfo) {
		return mapper.selectNoticeList(searchType,search,pageInfo);
	}

	// 공지사항 글쓰기
	public int writeNotice(AdminNoticeDTO noticeList) {
		int insertCount = mapper.insertNotice(noticeList);
		return insertCount;
	}
	
	// 공지사항 상세페이지 조회
	public AdminNoticeDTO getAdminNoticeView(String notice_idx) {
		return mapper.selectNoticeView(notice_idx);
	}

	// 공지사항 삭제
	public boolean removeNotice(AdminNoticeDTO noticeList, int pageNum) {
		return mapper.deleteNoticeList(noticeList);
	}

	// 공지사항 수정
	public boolean modifyNotice(AdminNoticeDTO noticeList) {
		return mapper.updateNotice(noticeList);
	}

	//------------------------------qna-------------------------------------------------------------
	// qna 총게시물수 카운트
	public int getQNAListCount() {
		
		return mapper.selectQNAListCount();
	}

	// qna 목록+검색
	public List<AdminQNADTO> getQNAList(PageInfo pageInfo) {
		System.out.println("pageInfo : " +pageInfo);
		return mapper.selectQNAList(pageInfo);
	}

	// qna 글쓰기
	public int selectQNANumDate() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int writeQNA(AdminQNADTO qnaList, int num) {
		int insertCount = mapper.insertQNA(qnaList);
		return insertCount;
	}
//
//	// qna 상세페이지 조회
//	public AdminQNADTO getAdminQNAView(String qna_idx) {
//		return mapper.selectQNAView(qna_idx);
//	}
//
//	// qna 글삭제
//	public boolean removeQNA(AdminQNADTO qnaList, int pageNum) {
//		return mapper.deleteQNAList(qnaList);
//	}
//
//	// qna 글수정
//	public boolean modifyQNA(AdminQNADTO qnaList) {
//		return mapper.updateQNA(qnaList);
//	}


}
