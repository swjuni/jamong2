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
	public int existUser(String userid);
	public String selectForUserLogin(String userid);
	public UserInfoVO selectUser(String userid);
	public int updateUser (UserInfoVO vo);
	public UserInfoVO selectByuserNo(int userNo);
	public int findUserPwd(UserInfoVO vo);
	public int outUser(String userId);
	public List<String> AllUserEmail();
	public Map<String, Object> selectViewByUserNo(int userNo);
}
