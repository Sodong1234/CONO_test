package com.itwillbs.cono.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MessageMapper;
import com.itwillbs.cono.vo.MessageDTO;

@Service
public class MessageService {
	@Autowired
	private MessageMapper mapper;

	public ArrayList<MessageDTO> messageList(String sId) {
		ArrayList<MessageDTO> list = (ArrayList<MessageDTO>)mapper.selectMessageList(sId);
		
		for(MessageDTO mdto : list) {
			mdto.setMember_id(sId);
			// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = mapper.count_unread(mdto);
			// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			String profile = mapper.get_other_profile(mdto);
			// 안읽은 메세지 갯수를 mto에 set한다.
			mdto.setUnread(unread);
			// 메세지 상대의 프로필사진을 mto에 set한다.
			mdto.setProfile(profile);
			// 메세지 상대 nick을 세팅한다. other_nick
			if (sId.equals(mdto.getSend_nick())) {
				mdto.setShop_idx(mdto.getRecv_nick());
			} else {
				mdto.setShop_idx(mdto.getSend_nick());
			}
		}
		return list;
	}
	
	public ArrayList<MessageDTO> roomContentList(int room, String sId) {
//		System.out.println("room : " + dto.getRoom());
//		System.out.println("recv_nick : " + dto.getRecv_nick());
//		System.out.println("nick : " + dto.getMember_id());
		// 메세지 내역을 가져온다
		ArrayList<MessageDTO> clist = (ArrayList<MessageDTO>)mapper.room_content_list(room, sId);

		// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		mapper.message_read_chk(sId);

		return clist;
	}
	
	// 메세지 list에서 메세지를 보낸다.
		public int messageSendInlist(MessageDTO dto) {
			
			// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
			if(dto.getRoom() == 0) {	// room이 0이라면 프로필에서 보낸거다
				int exist_chat = mapper.exist_chat(dto);
				// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
				if(exist_chat == 0) {	// 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
					int max_room = mapper.max_room(dto);
					dto.setRoom(max_room+1);
				}else {		// 메세지 내역이 있다면 해당 room 번호를 가져온다.
					int room = Integer.parseInt(mapper.select_room(dto) );
					dto.setRoom(room);
				}
			}
			
			int flag = mapper.messageSendInlist(dto);
			return flag;
		}

}
