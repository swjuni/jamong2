package com.ez.jamong.log.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogService{
	@Autowired private LogDAO logDao;

	@Override
	public int insertLogs(LogVO vo) {
		return logDao.insertLogs(vo);
	}
}
