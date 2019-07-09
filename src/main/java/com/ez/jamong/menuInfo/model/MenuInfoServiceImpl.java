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
}
