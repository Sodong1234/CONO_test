package com.itwillbs.cono.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.MessageService;
import com.itwillbs.cono.vo.MsgChatDTO;

@Controller
public class MessageController {

	@Autowired
	MessageService service;

	// 문의하기 버튼 클릭시 room 생성
	@RequestMapping(value = "addMessageList", method = RequestMethod.GET)
	public String insert_message_list(Model model, HttpSession session, String shop_idx, String item_idx) {
		String sId = (String)session.getAttribute("sId");
		
		service.setMessageList(sId, shop_idx, item_idx);
		return "message/message_list";
	}
	// member - shop room 목록
	@RequestMapping(value = "message_list", method = RequestMethod.GET)
	public String msglist_shop(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String,String>> msgList = service.getMsgList(sId);
		System.out.println(msgList.isEmpty());
		model.addAttribute("msgList",msgList);
		return "message/message_list";
	}
//	// shop - member room 목록
//	@RequestMapping(value = "msgList_shop", method = RequestMethod.GET)
//	public String msgList_shop(Model model, HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
////		String shop_idx = service.selectShop_idx(sId);
//		
//		List<HashMap<String,String>> msgList = service.getMsgList_shop(sId);
//		
//		
//		return "message/msgList_shop";
//	}
	
	// content 입력
	@RequestMapping(value = "setSendMsg", method = RequestMethod.GET)
	public int insertMsgContent(@RequestParam String msgList_room,@RequestParam String shop_idx,@RequestParam String content , HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		System.out.println("rNum : " + msgList_room);
		System.out.println("sName : " + shop_idx);
		System.out.println("content : " + content);
		
		MsgChatDTO dto = new MsgChatDTO();
		dto.setMsgList_room(msgList_room);
		dto.setMsgChat_send(sId);
		dto.setMsgChat_recv(shop_idx);
		dto.setMsgChat_content(content);
		
		int insertCount = 0;
		insertCount = service.setMsgContent(dto);
		System.out.println("insertMsgContent : "+insertCount);
		return insertCount; 
	}
	// content 불러오기
	@RequestMapping(value = "getAllMsg", method = RequestMethod.GET)
	public String getAllMsg(@RequestParam String msgList_room, Model model) {
		System.out.println("getAllmsg msgList_room : " + msgList_room);
		List<HashMap<String,String>> Allmsg = service.getAllMsg(msgList_room);
		model.addAttribute("Allmsg",Allmsg);
		return "message/message_content_list";
	}

	// Message DELETE 
	@RequestMapping(value = "msgDelete", method = RequestMethod.GET)
	public String deleteMsg(@RequestParam String msgList_room, HttpSession session) {
		int deleteCount = service.deleteMsg(msgList_room);
		System.out.println(deleteCount);
		return "message_list";
	}

	// -------------- 내 상점 문의
	
	@RequestMapping(value = "shop_msgList", method = RequestMethod.GET)
	public String msgList_member(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		String shop_idx = service.selectShop_idx(sId);
		
		List<HashMap<String,String>> msgList = service.getShopMsgList(shop_idx);
		System.out.println(msgList.isEmpty());
		model.addAttribute("msgList",msgList);
		return "message/shop_msgList";
	}
	
	// ------------ 완성
	
		@RequestMapping(value = "shop_getAllMsg", method = RequestMethod.GET)
		public String getShopAllMsg(@RequestParam String msgList_room, Model model,  HttpSession session) {
			String sId = (String)session.getAttribute("sId");
			String shop_idx = service.selectShop_idx(sId);
			System.out.println("getAllmsg msgList_room : " + msgList_room);
			List<HashMap<String,String>> Allmsg = service.getAllMsg(msgList_room);
			
			model.addAttribute("Allmsg",Allmsg);
			session.setAttribute("shop_idx", shop_idx);

			
			return "message/shopMsg_content_list";
		}
		
		// shop 메시지 보내기
		@RequestMapping(value = "shop_setSendMsg", method = RequestMethod.GET)
		public int insertShopMsgContent(@RequestParam String msgList_room,@RequestParam String member_id,@RequestParam String content , HttpSession session) {
			String sId = (String)session.getAttribute("sId");
			String shop_idx = service.selectShop_idx(sId);
			
			System.out.println("rNum : " + msgList_room);
			System.out.println("mId : " + member_id);
			System.out.println("content : " + content);
			
			MsgChatDTO dto = new MsgChatDTO();
			dto.setMsgList_room(msgList_room);
			dto.setMsgChat_send(shop_idx);
			dto.setMsgChat_recv(member_id);
			dto.setMsgChat_content(content);
			
			int insertCount = 0;
			insertCount = service.setMsgContent(dto);
			System.out.println("insertMsgContent : "+insertCount);
			return insertCount; 
		}

	
}
