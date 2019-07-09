package com.ez.jamong.guide.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuideDAOMybatis implements GuideDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.guide.";
	@Override
	public int guideAdd(GuideVO guideVo) {
		return sqlSession.insert(namespace+"guideAdd", guideVo);
	}
	@Override
	public List<GuideVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}
	@Override
	public GuideVO selectByNo(int guideNo) {
		return sqlSession.selectOne(namespace+"selectByNo", guideNo);
	}
	@Override
	public int updateGuide(GuideVO guideVo) {
		return sqlSession.update(namespace+"updateGuide", guideVo);
	}
	@Override
	public int deleteGuide(int guideNo) {
		return sqlSession.delete(namespace+"deleteGuide", guideNo);
	}
	
}
