package com.ez.jamong.files.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FilesServiceImpl implements FilesService{
	@Autowired FilesDAO filesDao;

	@Override
	public List<FilesVO> selectfileUser(int userno) {
		return filesDao.selectfileUser(userno);
	}

	@Override
	public List<FilesVO> selectfileExpert(int userno) {
		return filesDao.selectfileExpert(userno);
	}

}
