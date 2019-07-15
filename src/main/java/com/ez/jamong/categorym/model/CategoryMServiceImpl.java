package com.ez.jamong.categorym.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryMServiceImpl implements CategoryMService{
	@Autowired
	private CategoryMDAO categoryDao;

	@Override
	public int categorymAdd(CategoryMVO vo) {
		return categoryDao.categorymAdd(vo);
	}

	@Override
	public List<CategoryMVO> selectCategorymAll() {
		return categoryDao.selectCategorymAll();
	}

	@Override
	public CategoryMVO selectCategorymByNo(int categoryNoM) {
		return categoryDao.selectCategorymByNo(categoryNoM);
	}

	@Override
	public int updateCategorym(CategoryMVO vo) {
		return categoryDao.updateCategorym(vo);
	}

	@Override
	public int deleteCategorym(int categoryNoM) {
		return categoryDao.deleteCategorym(categoryNoM);
	}

	@Override
	public Map<String, Object> selectCategoryView(int categoryNoM) {
		return categoryDao.selectCategoryView(categoryNoM);
	}

	@Override
	public List<Map<String, Object>> selectCategoryAllView() {
		return categoryDao.selectCategoryAllView();
	}

	@Override
	public List<CategoryMVO> selectCategoryM(int categoryNoL) {
		return categoryDao.selectCategoryM(categoryNoL);
	}
	
	
	
}
