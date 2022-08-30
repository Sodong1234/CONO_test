package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.MsgChatDTO;

public interface MessageMapper {
	// 메시지 리스트 등록
	public int insertMsgList(@Param("sId") String sId, @Param("shop_idx") String shop_idx, @Param("item_idx") String item_idx);
	// 메시지 리스트 목록 뽑기
	public List<HashMap<String, String>> selectMsgList(@Param("sId") String sId);
	// 메시지 내용 입력
	public int insertMsgContent(@Param("dto") MsgChatDTO dto);
	// 메시지 내용 출력
	public List<HashMap<String, String>> selectAllMsg(String msgList_room);
	// 메시지 삭제
	public int deleteMsg(String msgList_room);
	// shop name 출력
	public String selectShop_name(String msgList_room);
	
	
	
	
	
	
	public String selectShop_idx(String sId);
	
	public List<HashMap<String, String>> selectShopMsgList(String shop_idx);
	// Room 번호
	public String selectRoomNun();
	// 샵 - 상대 닉네임
	public String selectShop_member_nick(String msgList_room);
	


}
