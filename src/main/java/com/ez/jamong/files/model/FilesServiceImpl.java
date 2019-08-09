package com.ez.jamong.files.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FilesServiceImpl implements FilesService{
	@Autowired FilesDAO filesDao;

	@Override
	public List<Map<String, Object>> selectfileUser(int userno) {
		return filesDao.selectfileUser(userno);
	}

	@Override
	public List<Map<String, Object>> selectfileExpert(int userno) {
		return filesDao.selectfileExpert(userno);
	}

	@Override
	public int insertFiles(FilesVO vo) {
		return filesDao.insertFiles(vo);
	}

}
