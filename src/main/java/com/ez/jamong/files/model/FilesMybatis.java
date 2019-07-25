package com.ez.jamong.files.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FilesMybatis implements FilesDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.files.";
	@Override
	public List<FilesVO> selectfileUser(int userno) {
		return sqlSession.selectList(namespace+"selectfileUser",userno);
	}
	@Override
	public List<FilesVO> selectfileExpert(int userno) {
		return sqlSession.selectList(namespace+"selectfileExpert",userno);
	}
	
}
