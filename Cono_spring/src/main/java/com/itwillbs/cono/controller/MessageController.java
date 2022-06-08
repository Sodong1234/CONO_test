package com.itwillbs.cono.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.cono.service.MessageService;
import com.itwillbs.cono.vo.MessageDTO;

@Controller
public class MessageController {
	@Autowired
	private MessageService service;
	
	// 메시지 목록
	@RequestMapping(value = "message_list", method = RequestMethod.GET)
	public String message_list(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");

		// 메시지 리스트
		ArrayList<MessageDTO> list = service.messageList(sId);
		model.addAttribute(list);
		
		return "message/message_list";
	}
	// 메시지 목록
	@RequestMapping(value = "message_ajax_list", method = RequestMethod.GET)
	public String message_ajax_list(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 메시지 리스트
		ArrayList<MessageDTO> list = service.messageList(sId);
		model.addAttribute("list",list);
		
		return "message/message_ajax_list";
	}
	
	// 메시지 내용 가져오기
	@RequestMapping(value = "/message_content_list", method = RequestMethod.GET)
	public String message_content_list(int room, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		ArrayList<MessageDTO> clist = service.roomContentList(room, sId);
		model.addAttribute("clist",clist);
		return "message/message_content_list";
	}
	
//	 메시지 리스트 메시지 전송
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist")
	public int message_send_inlist(@RequestParam int room, @RequestParam String shop_idx,
			@RequestParam String content, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		MessageDTO dto = new MessageDTO();
		dto.setRoom(room);
		dto.setSend_nick(sId);
		dto.setRecv_nick(shop_idx);
		dto.setContent(content);
		int flag = service.messageSendInlist(dto);
		return flag;
	}
	
	
	
}
