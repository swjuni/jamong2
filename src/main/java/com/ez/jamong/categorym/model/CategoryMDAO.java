package com.ez.jamong.categorym.model;

import java.util.List;
import java.util.Map;

public interface CategoryMDAO {
	public int categorymAdd(CategoryMVO vo);
	public List<CategoryMVO> selectCategorymAll();
	public CategoryMVO selectCategorymByNo(int categoryNoM);
	public int updateCategorym(CategoryMVO vo);
	public int deleteCategorym(int categoryNoM);
	public Map<String, Object> selectCategoryView(int categoryNoM);
	public List<Map<String, Object>> selectCategoryAllView();
	public List<CategoryMVO>selectCategoryM(int categoryNoL);
}
