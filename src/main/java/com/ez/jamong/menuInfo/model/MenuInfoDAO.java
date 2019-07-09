package com.ez.jamong.menuInfo.model;

import java.util.List;
import java.util.Map;

public interface MenuInfoDAO {
	public int suspendedByPdNo(int productNo);
	public List<MenuInfoVO> selectMenuInfoAll();
	public MenuInfoVO selectMenuInfoByNo(int productNo);
	public int updateMenuInfo(MenuInfoVO vo);
	public int updateActivation(MenuInfoVO vo);
	public int deleteMenuInfo(int productNo);
	public Map<String, Object> selectMenuinfoView(int productNo);
	public List<Map<String, Object>> selectMenuinfoAllView();
}
