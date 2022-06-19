package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MessageMapper;
import com.itwillbs.cono.vo.MsgChatDTO;

@Service
public class MessageService {
	@Autowired
	private MessageMapper mapper;
	// 리스트 등록
	public int setMessageList(String sId, String shop_idx, String item_idx) {
		return mapper.insertMsgList(sId, shop_idx, item_idx);
	}
	// room 리스트 뽑기
	public List<HashMap<String, String>> getMsgList(String sId) {
		return mapper.selectMsgList(sId);
	}
	// 메시지 DB 넣기
	public int setMsgContent(MsgChatDTO dto) {
		return mapper.insertMsgContent(dto);
	}
	// 메시지 상세 내용 출력
	public List<HashMap<String, String>> getAllMsg(String msgList_room) {
		return mapper.selectAllMsg(msgList_room);
	}
	// 삭제
	public int deleteMsg(String msgList_room) {
		return mapper.deleteMsg(msgList_room);
	}
	public String selectShop_idx(String sId) {
		return mapper.selectShop_idx(sId);
	}
//	public List<HashMap<String, String>> getMsgList_shop(String sId) {
//		return null;
//	}
	public List<HashMap<String, String>> getShopMsgList(String shop_idx) {
		return mapper.selectShopMsgList(shop_idx);
	}
	


	}