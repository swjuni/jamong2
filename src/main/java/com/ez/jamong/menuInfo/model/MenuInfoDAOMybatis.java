package com.ez.jamong.menuInfo.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuInfoDAOMybatis implements MenuInfoDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.menuInfo.";
	
	@Override
	public int suspendedByPdNo(int productNo) {
		return sqlSession.update(namespace+"suspendedByPdNo",productNo);
	}
	@Override
	public List<MenuInfoVO> selectMenuInfoAll() {
		return sqlSession.selectList(namespace + "selectMenuInfoAll");
	}
	@Override
	public MenuInfoVO selectMenuInfoByNo(int productNo) {
		return sqlSession.selectOne(namespace + "selectMenuInfoByNo", productNo);
	}
	@Override
	public int updateMenuInfo(MenuInfoVO vo) {
		return sqlSession.update(namespace + "updateMenuInfo", vo);
	}
	@Override
	public int updateActivation(MenuInfoVO vo) {
		return sqlSession.update(namespace + "updateActivation", vo);
	}
	@Override
	public int deleteMenuInfo(int productNo) {
		return sqlSession.delete(namespace + "deleteMenuInfo", productNo);
	}
	@Override
	public Map<String, Object> selectMenuinfoView(int productNo) {
		return sqlSession.selectOne(namespace + "selectMenuinfoView", productNo);
	}
	@Override
	public List<Map<String, Object>> selectMenuinfoAllView() {
		return sqlSession.selectList(namespace + "selectMenuinfoAllView");
	}
	
	@Override
	public List<Map<String, Object[]>> selectMenuinfoYearCount() {
		return sqlSession.selectList(namespace+"selectMenuinfoYearCount");
	}
	@Override
	public List<Map<String, Object[]>> selectAdsYearCount() {
		return sqlSession.selectList(namespace+"selectAdsYearCount");
	}
	@Override
	public int insertProduct(MenuInfoVO vo) {
		return sqlSession.insert(namespace+"insertProduct",vo);
	}
	@Override
	public MenuInfoVO NonAvtivatedProduct(int expertNo) {
		return sqlSession.selectOne(namespace+"NonAvtivatedProduct", expertNo);
	}
}
