package com.ez.jamong.image;

import java.util.List;
import java.util.Map;

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

	@Override
	public int insertImage(ImageVO imgVo) {
		return sqlSession.insert(namespace+"insertImage",imgVo);
	}

	@Override
	public List<ImageVO> selectImageByProductNo(int productNo) {
		return sqlSession.selectList(namespace+"selectImageByProductNo",productNo);
	}

	@Override
	public List<ImageVO> selectDelete(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectDelete",map);
	}

	@Override
	public int deleteImage(Map<String ,Object> map) {
		return sqlSession.delete(namespace+"deleteImage",map);
	}
	
	
}
