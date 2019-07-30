package com.ez.jamong.log.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAOMybatis implements LogDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.logs.";
	
	@Override
	public int insertLogs(LogVO vo) {
		return sqlSession.insert(namespace+"insertLogs",vo);
	}

	@Override
	public List<LogVO> selectLogs(int userNo) {
		return sqlSession.selectList(namespace+"selectLogs",userNo);
	}

	@Override
	public List<LogVO> selectLogsAll() {
		return sqlSession.selectList(namespace+"selectLogsAll");
	}
}
