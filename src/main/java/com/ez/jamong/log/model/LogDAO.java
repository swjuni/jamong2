package com.ez.jamong.log.model;

import java.util.List;

public interface LogDAO {
	public int insertLogs(LogVO vo);
	public List<LogVO> selectLogs(int userNo);
	public List<LogVO> selectLogsAll();
}
