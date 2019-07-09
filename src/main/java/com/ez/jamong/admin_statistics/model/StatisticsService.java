package com.ez.jamong.admin_statistics.model;

import java.util.List;

public interface StatisticsService {
	public int selectUser();
	public int selectPro();
	public List<StatisticsVO> selectCategotyMenuCount();
}
