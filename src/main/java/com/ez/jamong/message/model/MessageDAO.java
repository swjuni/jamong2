package com.ez.jamong.message.model;

import java.util.List;
import java.util.Map;

public interface MessageDAO {
	public int insertMessage(MessageVO vo);
	public List<MessageVO> selectSendMessage(String userid);
	public List<MessageVO> selectRecieveMessage(String userid);
	public List<MessageVO> trashRecieveMessage(String userid);
	public int updateSendMessage(int messageNo);
	public int updateRecieveMessage(int messageNo);
	public int deleteRecieveMessage(int messageNo);
	public int recoveryRecieveMessage(int messageNo);
}
