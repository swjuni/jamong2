package com.ez.jamong.img_detail;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImgDetailDAOMybatis implements ImgDetailDAO{
	@Autowired private SqlSessionTemplate session;
	private String namespace="config.mybatis.mapper.oracle.imgDetail.";
	
	@Override
	public int insertImgDetail(ImgDetailVO imgDetailVo) {
		return session.insert(namespace+"insertImgDetail",imgDetailVo);
	}
	
}
