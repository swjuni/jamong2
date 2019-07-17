package com.ez.jamong.log.model;

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
	
}
