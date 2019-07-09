package com.ez.jamong.Author.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthorDAOMybatis implements AuthorDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.author.";
	
	public List<AuthorVO> selectAutorityAll(String authorDesc) {
		List<AuthorVO> list
			=sqlSession.selectList(namespace+"selectAutorityAll",authorDesc);
		return list;
		
	}
	
	
}
