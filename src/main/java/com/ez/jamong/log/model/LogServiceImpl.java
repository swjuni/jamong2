package com.ez.jamong.log.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogService{
	@Autowired private LogDAO logDao;

	@Override
	public int insertLogs(LogVO vo) {
		return logDao.insertLogs(vo);
	}

	@Override
	public List<LogVO> selectLogs(int userNo) {
		return logDao.selectLogs(userNo);
	}

	@Override
	public List<LogVO> selectLogsAll() {
		return logDao.selectLogsAll();
	}
}
