package com.ez.jamong.Author.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorServiceImpl implements AuthorService{

	@Autowired
	private AuthorDAO admingradeDao;
	

	@Override
	public List<AuthorVO> selectAutorityAll(String authorDesc) {
		return admingradeDao.selectAutorityAll(authorDesc);
	}
	

}
