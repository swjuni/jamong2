package com.ez.jamong.image;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDAOMybatis implements ImageDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.image.";
	
	@Override
	public ImageVO selectByProductNoFirstImage(int productNo) {
		return sqlSession.selectOne(namespace+"selectByProductNoFirstImage",productNo);
	}
	
	
}
