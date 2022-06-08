package com.itwillbs.cono.mapper;

import java.util.ArrayList;
import java.util.List;

import com.itwillbs.cono.vo.MessageDTO;

public interface MessageMapper {
	public List<MessageDTO> selectMessageList(String sId);

	public ArrayList<MessageDTO> selectList(MessageDTO dto);

	public int count_unread(MessageDTO mdto);

	public String get_other_profile(MessageDTO mdto);

	public ArrayList<MessageDTO> room_content_list(int room, String sId);

	public void message_read_chk(String sId);

	public int exist_chat(MessageDTO dto);

	public int max_room(MessageDTO dto);

	public String select_room(MessageDTO dto);

	public int messageSendInlist(MessageDTO dto);
}
