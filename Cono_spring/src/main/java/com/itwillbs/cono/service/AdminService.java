package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.AdminMapper;
import com.itwillbs.cono.vo.AdminNoticeDTO;
import com.itwillbs.cono.vo.AdminQNADTO;
import com.itwillbs.cono.vo.AdminReportDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	//------------------------------notice-------------------------------------
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
		return mapper.selectQNAList(pageInfo);
	}

	// qna 글쓰기
	public int selectQNANum() {
		return mapper.selectQNANum();
	}
	 
	public int writeQNA(AdminQNADTO qnaList,int num,String sId) {
		qnaList.setNum(num);
		int insertCount = mapper.insertQNA(qnaList);
		return insertCount;
	}

	// qna 상세페이지 조회
	public AdminQNADTO getAdminQNAView(String qna_idx) {
		return mapper.selectQNAView(qna_idx);
	}
	
	// qna 글삭제
	public boolean removeQNA(AdminQNADTO qnaList, int pageNum) {
		return mapper.deleteQNAList(qnaList);
	}

	// qna 글수정
	public boolean modifyQNA(AdminQNADTO qnaList) {
		return mapper.updateQNA(qnaList);
	}

	// qna 답글
	public int selectNumSeq(HashMap<String, Integer> param) {
		AdminQNADTO dto = new AdminQNADTO();
		dto.setNum(param.get("qna_re_ref"));
		dto.setQna_re_seq(param.get("qna_re_lev"));
		return mapper.selectNumSeq(param);
	}

	public int writeQNAReply(AdminQNADTO qnaList, int num, String sId, int num_seq) {
		int insertCount = mapper.writeQNAReply(qnaList,num,sId,num_seq);
		return insertCount;
	}

	public void updateQNAStatus(String qna_idx) {
		 mapper.updateQNAStatus(qna_idx); 
	}

	//------------------------------------report-------------------------------------
	// report 총게시물수 카운트
	public int getReportListCount() {
		return mapper.selectReportListCount();
	}
	
	// report 목록
	public List<AdminReportDTO> getReportList(PageInfo pageInfo) {
		return mapper.selectReportList(pageInfo);
	}
	
	// report 글쓰기
	public int writeReport(AdminReportDTO reportList) {
		int insertCount =mapper.writeReport(reportList);
		return insertCount;
	}

	// report 상세페이지
	public AdminReportDTO getAdminReportView(String report_idx) {
		return mapper.selectReportView(report_idx);
	}

	// report 글수정
	public boolean modifyReport(AdminReportDTO reportList) {
		return mapper.updateReport(reportList); 
	}

	// report 글삭제
	public boolean removeReport(AdminReportDTO reportList, int pageNum) {
		return mapper.deleteReportList(reportList);
	}

	// report 관리자가 상품 글삭제
	public boolean removeReportAdmin(String item_idx) {
		return mapper.deleteReportListAdmin(item_idx);
	}

	public void updateReportStatus(String report_idx) {
		 mapper.updateReportStatus(report_idx); 
		
	}

//	public String getMemberId(String qna_idx) {
//		return mapper.selectQNAMemberId(qna_idx);
//	}


}








