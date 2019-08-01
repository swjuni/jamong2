package com.ez.jamong.ads.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdsDAOMybatis implements AdsDAO{
	@Autowired private SqlSessionTemplate session;
	private String namespace="config.mybatis.mapper.oracle.ads.";
	
	@Override
	public List<Map<String, Object>> selectShowAds() {
		return session.selectList(namespace+"selectShowAds");
	}

	@Override
	public List<AdsVO> AgreeAds() {
		return session.selectList(namespace+"AgreeAds");
	}
	
}
