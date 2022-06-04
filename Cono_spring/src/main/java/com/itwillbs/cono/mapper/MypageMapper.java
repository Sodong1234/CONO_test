package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

public interface MypageMapper {

	// 최근 조회 게시물 수
	public int selectRecentViewCount();

	// 아직 ㄴㄴ
	public List<List<String>> selectBoardList(String searchType, String keyword, PageInfo pageInfo, String sId);

	// 회원 상세 조회 (for 수정)
	public MemberDTO selectMemberInfo(String sId);
	
	// 회원 정보 수정
	public int updateMemberInfo(@Param("sId") String sId, @Param("member") MemberDTO member);

	// 코인 내역 리스트 COUNT
	public int coinListCount(String sId);
	
	// 코인 내역 조회
	public List<CoinDTO> selectCoinInfoList(@Param("sId") String sId);
	
	// 현재 보유 코인
	public String coinTotal(String sId);
	
	// 쿠폰함 - 보유 쿠폰
	public List<CouponDTO> couponList(String sId);

	// 장바구니 - 장바구니 아이템 리스트
	public List<HashMap<String, String>> selectBasketList(String sId);

	// 구매완료 - 구매완료 아이템 리스트
	public List<HashMap<String, String>> selectPerchasedList(String sId);

	// 예약 중 - 예약 진행 중인 상품 리스트
	public List<HashMap<String, String>> selectReservedList(String sId);

	public List<HashMap<String, String>> selectFollowingList(String sId);

	public List<HashMap<String, String>> selectFollowerList(String sId);

	
	
	
	
}
