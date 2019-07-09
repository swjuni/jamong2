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
	public EvaluationVO selectByNo(int evalNo) {
		return evaluationDao.selectByNo(evalNo);
	}

	@Override
	public int deleteEvaluation(int evalNo) {
		return evaluationDao.deleteEvaluation(evalNo);
	}

}
