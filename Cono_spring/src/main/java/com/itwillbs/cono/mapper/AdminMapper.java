package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.AdminNoticeDTO;
import com.itwillbs.cono.vo.AdminQNADTO;
import com.itwillbs.cono.vo.AdminReportDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.PageInfo;

public interface AdminMapper {

	//-------------------------------notice--------------------------------------
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
	public int selectQNANum();
	public int insertQNA(AdminQNADTO qnaList);

	// qna 상세페이지
	public AdminQNADTO selectQNAView(String qna_idx);

	// qna 삭제
	public boolean deleteQNAList(AdminQNADTO qnaList);

	// qna 수정
	public boolean updateQNA(AdminQNADTO qnaList);

	// qna 답글
	public int selectNumSeq(HashMap<String, Integer> param);

	public int writeQNAReply(@Param("qnaList") AdminQNADTO qnaList,@Param("num") int num,@Param("sId") String sId,@Param("num_seq") int num_seq);

	public void updateQNAStatus(String qna_idx);

	//---------------------------report-------------------------------------------
	// report 총게시물수 카운트
	public int selectReportListCount();
	
	// report 목록 조회
	public List<AdminReportDTO> selectReportList(@Param("pageInfo")PageInfo pageInfo);
	
	// report 글쓰기
	public int writeReport(AdminReportDTO reportList);

	// report 상세페이지
	public AdminReportDTO selectReportView(String report_idx);

	// report 글수정
	public boolean updateReport(AdminReportDTO reportList);

	// report 글삭제
	public boolean deleteReportList(AdminReportDTO reportList);

	// 관리자가 report 당한 글삭제
	public boolean deleteReportListAdmin(ItemDTO itemList);

//	public String selectQNAMemberId(String qna_idx);



	

	
}
