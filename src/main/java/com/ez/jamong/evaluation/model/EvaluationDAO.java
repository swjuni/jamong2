package com.ez.jamong.evaluation.model;

import java.util.List;
import java.util.Map;

public interface EvaluationDAO {
	List<Map<String, Object>> selectAll();
	Map<String, Object> selectByNo(int evalNo);
	int deleteEvaluation(int evalNo);
	int evaluationAdd(EvaluationVO evaluationVo);
	List<EvaluationVO> evaluationListByPdNo(int productNo);
	String evalAvgByExpertNo(int expertNo);
}
