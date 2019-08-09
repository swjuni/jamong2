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
	public Map<String, Object> selectByNo(int evalNo) {
		return sqlSession.selectOne(namespace+"selectByNo", evalNo);
	}
	@Override
	public int deleteEvaluation(int evalNo) {
		return sqlSession.delete(namespace+"deleteEvaluation", evalNo);
	}
	@Override
	public int evaluationAdd(EvaluationVO evaluationVo) {
		return sqlSession.insert(namespace+"evaluationAdd", evaluationVo);
	}
	@Override
	public List<EvaluationVO> evaluationListByPdNo(int productNo) {
		return sqlSession.selectList(namespace+"evaluationListByPdNo", productNo);
	}
	@Override
	public String evalAvgByExpertNo(int expertNo) {
		return sqlSession.selectOne(namespace+"evalAvgByExpertNo",expertNo);
	}
	@Override
	public List<Map<String, Object>> selectToday() {
		return sqlSession.selectList(namespace+"selectToday");
	}
	@Override
	public Map<String, Object> selectRecentOne(int evalNo) {
		return sqlSession.selectOne(namespace+"selectRecentOne",evalNo);
	}

}
