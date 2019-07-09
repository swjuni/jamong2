package com.ez.jamong.categoryl.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryLDAOMybatis implements CategoryLDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.categoryl.";
	
	@Override
	public int categorylAdd(CategoryLVO vo) {
		return sqlSession.insert(namespace + "categorylAdd", vo);
	}

	@Override
	public List<CategoryLVO> selectCategorylAll() {
		return sqlSession.selectList(namespace + "selectCategorylAll");
	}

	@Override
	public CategoryLVO selectCategorylByNo(int categoryNo) {
		return sqlSession.selectOne(namespace + "selectCategorylByNo", categoryNo);
	}

	@Override
	public int updateCategoryl(CategoryLVO vo) {
		return sqlSession.update(namespace + "updateCategoryl", vo);
	}

	@Override
	public int deleteCategoryl(int categoryNo) {
		return sqlSession.delete(namespace + "deleteCategoryl", categoryNo);
	}

	
}
