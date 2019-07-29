package com.ez.jamong.userInfo.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.SearchVO;

public interface UserInfoService {
	//아이디 중복확인에서 사용하는 final변수
	public static final int USEFUL_USERID=1;  //사용가능한 아이디
	public static final int NON_USEFUL_USERID=2;  //사용불가능한 아이디
	
	//로그인처리에서 사용하는 final 변수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
	
	public List<Map<String, Object>> selectUserInfoSearch(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int memberInactiveByUserNo(int userNo);
	public int memberActiveByUserNo(int userNo);
	public int memberInActiveMulti(String[] chk);
	public int memberActiveMulti(String[] chk);
	public int registUser(UserInfoVO vo);
	public int existUser(String userid);
	public int userLoginCheck(String userid, String pwd);
	public UserInfoVO selectUser(String userid);
	public int updateUser (UserInfoVO vo);
	public UserInfoVO selectByuserNo(int userNo);
	public int findUserPwd(UserInfoVO vo);
	public int outUser(String userId);
	public List<String> AllUserEmail();
}


