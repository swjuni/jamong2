package com.ez.jamong.admin_statistics.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsServiceImpl implements StatisticsService{
	@Autowired
	StatisticsDAO statisticsDao;
	
	@Override
	public int selectUser() {
		return statisticsDao.selectUser();
	}

	@Override
	public int selectPro() {
		// TODO Auto-generated method stub
		return statisticsDao.selectPro();
	}

	@Override
	public List<StatisticsVO> selectCategotyMenuCount() {
		return statisticsDao.selectCategotyMenuCount();
	}

}
