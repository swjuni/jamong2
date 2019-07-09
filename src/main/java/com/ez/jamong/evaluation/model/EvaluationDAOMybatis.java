package com.ez.jamong.evaluation.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EvaluationDAOMybatis implements EvaluationDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.evaluation.";
	@Override
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}
	@Override
	public EvaluationVO selectByNo(int evalNo) {
		return sqlSession.selectOne(namespace+"selectByNo", evalNo);
	}
	@Override
	public int deleteEvaluation(int evalNo) {
		return sqlSession.delete(namespace+"deleteEvaluation", evalNo);
	}

}
