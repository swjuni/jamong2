package com.ez.jamong.admin_statistics.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAOMybatis implements StatisticsDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.categorym.";
	
	@Override
	public int selectUser() {
		return sqlSession.selectOne(namespace+"selectUser");
	}

	@Override
	public int selectPro() {
		return sqlSession.selectOne(namespace+"selectPro");
	}

	@Override
	public List<StatisticsVO> selectCategotyMenuCount() {
		return sqlSession.selectList(namespace+"selectCategotyMenuCount");
	}
	
	
	

}
