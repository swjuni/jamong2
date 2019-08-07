package com.ez.jamong.pay.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.jamong.common.DateSearchVO;

@Repository
public class PayDAOMybatis implements PayDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.pay.";
	
	@Override
	public List<Map<String, Object>> selectByUserNo(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace+"selectByUserNo", dateSearchVo);
	}

	@Override
	public int selectTotalRecord(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", dateSearchVo);
	}

	@Override
	public Map<String, Object> selectTopSellUser() {
		return sqlSession.selectOne(namespace+"selectTopSellUser");
	}

}
