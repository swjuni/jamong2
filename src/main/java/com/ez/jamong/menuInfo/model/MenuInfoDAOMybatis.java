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
	private String namespaceList="config.mybatis.mapper.oracle.menuInfoList.";
	
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
	
	//원준 상품목록화면 사용 메서드
	@Override
	public List<MenuInfoExtendsVO> menuinfoByList(MenuInfoSearchVO searchVo) {
		return sqlSession.selectList(namespaceList+"menuinfoByList", searchVo);
	}
	//원준 상품목록화면 사용 메서드
	@Override
	public int selectTotalCount(MenuInfoSearchVO searchVo) {
		return sqlSession.selectOne(namespaceList+"selectTotalCount", searchVo);
	}
	@Override
	public int updateMenuInfo1(MenuInfoVO menuInfoVo) {
		return sqlSession.update(namespace+"updateMenuInfo1",menuInfoVo);
	}
	@Override
	public int updateMenuInfo2(MenuInfoVO menuInfoVo) {
		return sqlSession.update(namespace+"updateMenuInfo2",menuInfoVo);
	}
	@Override
	public int registProduct(int productNo) {
		return sqlSession.update(namespace+"registProduct",productNo);
	}
	
	@Override
	public String selectFromProductUserId(int productNo) {
		return sqlSession.selectOne(namespace+"selectFromProductUserId",productNo);
	}
	@Override
	public List<Map<String, Object>> selectByExpertNo(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectByExpertNo",map);
	}
	@Override
	public int countByExpertNo(Map<String , Object> map) {
		return sqlSession.selectOne(namespace+"countByExpertNo",map);
	}
	@Override
	public int deleteProduct(int productNo) {
		return sqlSession.update(namespace+"deleteProduct",productNo);
	}
}
