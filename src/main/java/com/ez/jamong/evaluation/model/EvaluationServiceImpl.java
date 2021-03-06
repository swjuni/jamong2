package com.ez.jamong.evaluation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EvaluationServiceImpl implements EvaluationService{
	@Autowired private EvaluationDAO evaluationDao;

	@Override
	public List<Map<String, Object>> selectAll() {
		return evaluationDao.selectAll();
	}

	@Override
	public Map<String, Object> selectByNo(int evalNo) {
		return evaluationDao.selectByNo(evalNo);
	}

	@Override
	public int deleteEvaluation(int evalNo) {
		return evaluationDao.deleteEvaluation(evalNo);
	}

	@Override
	public int evaluationAdd(EvaluationVO evaluationVo) {
		return evaluationDao.evaluationAdd(evaluationVo);
	}

	@Override
	public List<EvaluationVO> evaluationListByPdNo(int productNo) {
		return evaluationDao.evaluationListByPdNo(productNo);
	}

	@Override
	public String evalAvgByExpertNo(int expertNo) {
		return evaluationDao.evalAvgByExpertNo(expertNo);
	}

	@Override
	public List<Map<String, Object>> selectToday() {
		return evaluationDao.selectToday();
	}

	@Override
	public Map<String, Object> selectRecentOne(int evalNo) {
		return evaluationDao.selectRecentOne(evalNo);
	}

}
