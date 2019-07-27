package com.ez.jamong.menuInfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuInfoServiceImpl implements MenuInfoService{
	@Autowired MenuInfoDAO menuInfoDao;

	@Override
	public int suspendedByPdNo(int productNo) {
		return menuInfoDao.suspendedByPdNo(productNo);
	}

	@Override
	public List<MenuInfoVO> selectMenuInfoAll() {
		return menuInfoDao.selectMenuInfoAll();
	}

	@Override
	public MenuInfoVO selectMenuInfoByNo(int productNo) {
		return menuInfoDao.selectMenuInfoByNo(productNo);
	}

	@Override
	public int updateMenuInfo(MenuInfoVO vo) {
		return menuInfoDao.updateMenuInfo(vo);
	}

	@Override
	public int updateActivation(MenuInfoVO vo) {
		return menuInfoDao.updateActivation(vo);
	}

	@Override
	public int deleteMenuInfo(int productNo) {
		return menuInfoDao.deleteMenuInfo(productNo);
	}

	@Override
	public Map<String, Object> selectMenuinfoView(int productNo) {
		return menuInfoDao.selectMenuinfoView(productNo);
	}

	@Override
	public List<Map<String, Object>> selectMenuinfoAllView() {
		return menuInfoDao.selectMenuinfoAllView();
	}

	@Override
	public List<Map<String, Object[]>> selectMenuinfoYearCount() {
		return menuInfoDao.selectMenuinfoYearCount();
	}
	
	@Override
	public List<Map<String, Object[]>> selectAdsYearCount() {
		return menuInfoDao.selectAdsYearCount();
	}

	@Override
	public int saveProduct(MenuInfoVO vo) {
		MenuInfoVO menuvo=menuInfoDao.NonAvtivatedProduct(vo.getExpertNo());
		int cnt=0;
		if(menuvo==null) {
			cnt=menuInfoDao.insertProduct(vo);
		}
		return cnt;
	}

	@Override
	public MenuInfoVO NonAvtivatedProduct(int expertNo) {
		return menuInfoDao.NonAvtivatedProduct(expertNo);
	}

	//원준 상품목록화면 사용 메서드
	@Override
	public List<MenuInfoExtendsVO> menuinfoByList(MenuInfoSearchVO searchVo) {
		return menuInfoDao.menuinfoByList(searchVo);
	}
	//원준 상품목록화면 사용 메서드
	@Override
	public int selectTotalCount(MenuInfoSearchVO searchVo) {
		return menuInfoDao.selectTotalCount(searchVo);
	}
}
