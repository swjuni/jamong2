package com.ez.jamong.expert_profile.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpertProfileDAOMybatis implements ExpertProfileDAO{
	@Autowired
	private SqlSessionTemplate session;
	private String namespace="config.mybatis.mapper.oracle.expert_profile.";
	@Override
	public int insertProfile(ExpertProfileVO vo) {
		return session.insert(namespace+"insertProfile",vo);
	}

	@Override
	public int updateProfileMajor(ExpertProfileVO vo) {
		return session.update(namespace+"updateProfileMajor",vo);
	}

	@Override
	public int findCount(int expertNo) {
		return session.selectOne(namespace+"findCount", expertNo);
	}

	@Override
	public ExpertProfileVO selectByExpertNo(int expertNo) {
		return session.selectOne(namespace+"selectByExpertNo",expertNo);
	}

	@Override
	public int updateLicense(Map<String, Object> map) {
		return session.update(namespace+"updateLicense",map);
	}

	@Override
	public int updateCareer(Map<String, Object> map) {
		return session.update(namespace+"updateCareer",map);
	}
	
}
