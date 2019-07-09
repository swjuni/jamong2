package com.ez.jamong.categorym.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryMDAOMybatis implements CategoryMDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.categorym.";
	
	@Override
	public int categorymAdd(CategoryMVO vo) {
		return sqlSession.insert(namespace + "categorymAdd", vo);
	}

	@Override
	public List<CategoryMVO> selectCategorymAll() {
		return sqlSession.selectList(namespace + "selectCategorymAll");
	}

	@Override
	public CategoryMVO selectCategorymByNo(int categoryNoM) {
		return sqlSession.selectOne(namespace + "selectCategorymByNo", categoryNoM);
	}

	@Override
	public int updateCategorym(CategoryMVO vo) {
		return sqlSession.update(namespace + "updateCategorym", vo);
	}

	@Override
	public int deleteCategorym(int categoryNoM) {
		return sqlSession.delete(namespace + "deleteCategorym", categoryNoM);
	}

	@Override
	public Map<String, Object> selectCategoryView(int categoryNoM) {
		return sqlSession.selectOne(namespace + "selectCategoryView", categoryNoM);
	}
	

	@Override
	public List<Map<String, Object>> selectCategoryAllView() {
		return sqlSession.selectList(namespace + "selectCategoryAllView");
	}

	
	
}
