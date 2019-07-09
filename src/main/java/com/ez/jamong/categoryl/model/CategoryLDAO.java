package com.ez.jamong.categoryl.model;

import java.util.List;

public interface CategoryLDAO {
	public int categorylAdd(CategoryLVO vo);
	public List<CategoryLVO> selectCategorylAll();
	public CategoryLVO selectCategorylByNo(int categoryNo);
	public int updateCategoryl(CategoryLVO vo);
	public int deleteCategoryl(int categoryNo);

}
