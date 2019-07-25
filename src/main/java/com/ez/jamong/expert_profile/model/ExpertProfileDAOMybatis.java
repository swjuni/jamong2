package com.ez.jamong.expert_profile.model;

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
	
}
