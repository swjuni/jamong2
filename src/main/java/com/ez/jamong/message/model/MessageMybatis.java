package com.ez.jamong.message.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageMybatis implements MessageDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.message.";
	
	@Override
	public int insertMessage(MessageVO vo) {
		return sqlSession.insert(namespace+"insertMessage",vo);
	}
	
	@Override
	public List<MessageVO> selectSendMessage(String userid) {
		return sqlSession.selectList(namespace+"selectSendMessage",userid);
	}

	@Override
	public List<MessageVO> selectRecieveMessage(String userid) {
		return sqlSession.selectList(namespace+"selectRecieveMessage",userid);
	}


	@Override
	public List<MessageVO> trashRecieveMessage(String userid) {
		return sqlSession.selectList(namespace+"trashRecieveMessage",userid);
	}

	@Override
	public int updateSendMessage(int messageNo) {
		return sqlSession.update(namespace+"updateSendMessage",messageNo);
	}

	@Override
	public int updateRecieveMessage(int messageNo) {
		return sqlSession.update(namespace+"updateRecieveMessage",messageNo);
	}

	@Override
	public int deleteRecieveMessage(int messageNo) {
		return sqlSession.update(namespace+"deleteRecieveMessage",messageNo);
	}

	@Override
	public int recoveryRecieveMessage(int messageNo) {
		return sqlSession.update(namespace+"recoveryRecieveMessage",messageNo);
	}
	
	
}
