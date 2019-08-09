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


	@Override
	public int updateAutorityAdmin(AuthorVO vo) {
		return admingradeDao.updateAutorityAdmin(vo);
	}


	@Override
	public int gradeInsert(AuthorVO vo) {
		return admingradeDao.gradeInsert(vo);
	}


	@Override
	public int gradeDelete(String name) {
		return admingradeDao.gradeDelete(name);
	}


	@Override
	public List<AuthorVO> selectAuthorityList() {
		return admingradeDao.selectAuthorityList();
	}


	@Override
	public List<String> selectAuthorName() {
		return admingradeDao.selectAuthorName();
	}


	@Override
	public int selectAuthorLev(int authorNo) {
		return admingradeDao.selectAuthorLev(authorNo);
	}
	

}
