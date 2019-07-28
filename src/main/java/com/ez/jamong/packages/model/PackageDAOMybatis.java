package com.ez.jamong.packages.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PackageDAOMybatis implements PackageDAO{
	@Autowired private SqlSessionTemplate session;
	private String namespace="config.mybatis.mapper.oracle.package.";
	@Override
	public int insertPackage(PackageVO vo) {
		return session.insert(namespace+"insertPackage",vo);
	}
}
