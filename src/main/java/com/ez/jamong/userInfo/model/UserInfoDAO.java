package com.ez.jamong.userInfo.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.SearchVO;

public interface UserInfoDAO {
	public List<Map<String, Object>> selectUserInfoSearch(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int memberInactiveByUserNo(int userNo);
	public int memberActiveByUserNo(int userNo);
	public int registUser(UserInfoVO vo);
}
