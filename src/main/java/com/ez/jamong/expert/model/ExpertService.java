package com.ez.jamong.expert.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.SearchVO;

public interface ExpertService {
	public List<Map<String, Object>> selectExpertSearch(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
}
