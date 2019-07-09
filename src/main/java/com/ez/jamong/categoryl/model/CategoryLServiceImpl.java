package com.ez.jamong.categoryl.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryLServiceImpl implements CategoryLService{
	@Autowired
	private CategoryLDAO categoryDao;

	@Override
	public int categorylAdd(CategoryLVO vo) {
		return categoryDao.categorylAdd(vo);
	}

	@Override
	public List<CategoryLVO> selectCategorylAll() {
		return categoryDao.selectCategorylAll();
	}

	@Override
	public CategoryLVO selectCategorylByNo(int categoryNo) {
		return categoryDao.selectCategorylByNo(categoryNo);
	}

	@Override
	public int updateCategoryl(CategoryLVO vo) {
		return categoryDao.updateCategoryl(vo);
	}

	@Override
	public int deleteCategoryl(int categoryNo) {
		return categoryDao.deleteCategoryl(categoryNo);
	}

	
	
	
}
