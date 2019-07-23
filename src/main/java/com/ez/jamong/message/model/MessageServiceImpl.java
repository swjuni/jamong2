package com.ez.jamong.message.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired MessageDAO messageDao;

	@Override
	public int insertMessage(MessageVO vo) {
		return messageDao.insertMessage(vo);
	}

	@Override
	public List<MessageVO> selectSendMessage(String userid) {
		return messageDao.selectSendMessage(userid);
	}

	@Override
	public List<MessageVO> selectRecieveMessage(String userid) {
		return messageDao.selectRecieveMessage(userid);
	}

	
}
