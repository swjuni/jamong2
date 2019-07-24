package com.ez.jamong.message.model;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public int insertMessage(MessageVO vo);
	public List<MessageVO> selectSendMessage(String userid);
	public List<MessageVO> selectRecieveMessage(String userid);
}