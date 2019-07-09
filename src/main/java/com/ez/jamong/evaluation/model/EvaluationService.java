package com.ez.jamong.evaluation.model;

import java.util.List;
import java.util.Map;

public interface EvaluationService {
	List<Map<String, Object>> selectAll();
	EvaluationVO selectByNo(int evalNo);
	int deleteEvaluation(int evalNo);
}
