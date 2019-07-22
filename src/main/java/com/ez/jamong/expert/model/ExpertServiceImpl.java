package com.ez.jamong.expert.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	@Transactional
	public int InsertExpert(ExpertVO expertVo) {
		int cnt=expertDao.checkByUserNo(expertVo.getUserNo());
		System.out.println(expertVo.getBankName());
		if(cnt<=0) {
			cnt=expertDao.InsertExpert(expertVo);
		}else {
			cnt=expertDao.updateExpertBasicInfo(expertVo);
		}
		return cnt;
	}
	
}
