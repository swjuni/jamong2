package com.ez.jamong.img_detail;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<ImgDetailVO> selectImgDetailByProductNo(int productNo) {
		return session.selectList(namespace+"selectImgDetailByProductNo",productNo);
	}

	@Override
	public List<ImgDetailVO> selectDelete(Map<String, Object> map) {
		return session.selectList(namespace+"selectDelete", map);
	}

	@Override
	public int deleteImgDetail(Map<String, Object> map) {
		return session.delete(namespace+"deleteImgDetail",map);
	}
	
}
