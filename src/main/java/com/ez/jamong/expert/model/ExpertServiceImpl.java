package com.ez.jamong.expert.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.jamong.common.SearchVO;

@Service
public class ExpertServiceImpl implements ExpertService{
	@Autowired private ExpertDAO expertDao;

	@Override
	public List<Map<String, Object>> selectExpertSearch(SearchVO searchVo) {
		return expertDao.selectExpertSearch(searchVo);
	}
	
	public int selectTotalCount(SearchVO searchVo) {
		return expertDao.selectTotalCount(searchVo);
	}
	
}
