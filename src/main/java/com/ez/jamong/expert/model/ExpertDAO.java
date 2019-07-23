package com.ez.jamong.expert.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.SearchVO;

public interface ExpertDAO {
	public List<Map<String, Object>> selectExpertSearch(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int InsertExpert(ExpertVO expertVo);
	public int checkByUserNo(int userNo);
	public int updateExpertBasicInfo(ExpertVO expertVo);
	public ExpertVO selectByExpertNo(int expertNo);
}
