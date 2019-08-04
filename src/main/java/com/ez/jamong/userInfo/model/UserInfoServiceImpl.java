package com.ez.jamong.userInfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.common.SearchVO;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired private UserInfoDAO userInfoDao;
	
	//암호화 api
	private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
	@Override
	public List<Map<String, Object>> selectUserInfoSearch(SearchVO searchVo) {
		return userInfoDao.selectUserInfoSearch(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return userInfoDao.selectTotalCount(searchVo);
	}

	@Override
	public int memberInactiveByUserNo(int userNo) {
		return userInfoDao.memberInactiveByUserNo(userNo);
	}

	@Override
	public int memberActiveByUserNo(int userNo) {
		return userInfoDao.memberActiveByUserNo(userNo);
	}

	@Override
	@Transactional
	public int memberInActiveMulti(String[] chks) {
		int cnt=0;
		for(int i=0;i<chks.length;i++) {
			String userNo=chks[i];
			cnt=userInfoDao.memberInactiveByUserNo(Integer.parseInt(userNo));
		}
		return cnt;
	}
	
	@Override
	@Transactional
	public int memberActiveMulti(String[] chks) {
		int cnt=0;
		for(int i=0;i<chks.length;i++) {
			String userNo=chks[i];
			cnt=userInfoDao.memberActiveByUserNo(Integer.parseInt(userNo));
		}
		return cnt;
	}

	@Override
	public int registUser(UserInfoVO vo) {
		return userInfoDao.registUser(vo);
	}

	@Override
	public int existUser(String userid) {
		return userInfoDao.existUser(userid);
	}

	@Override
	public int userLoginCheck(String userid, String pwd) {
		String up = userInfoDao.selectForUserLogin(userid);
		int result=0;
		if(up==null || up.isEmpty()) {
			result=UserInfoService.ID_NONE;
		}else{
			if(encoder.matches(pwd, up)) {
				result=UserInfoService.LOGIN_OK;
			}else {
				result=UserInfoService.PWD_DISAGREE;
			}
		}
		return result;
	}

	@Override
	public UserInfoVO selectUser(String userid) {
		return userInfoDao.selectUser(userid);
	}

	@Override
	public int updateUser(UserInfoVO vo) {
		return userInfoDao.updateUser(vo);
	}
	
	@Override
	public UserInfoVO selectByuserNo(int userNo) {
		return userInfoDao.selectByuserNo(userNo);
	}

	@Override
	public int findUserPwd(UserInfoVO vo) {
		return userInfoDao.findUserPwd(vo);
	}

	@Override
	public int outUser(String userId) {
		return userInfoDao.outUser(userId);
	}

	@Override
	public List<String> AllUserEmail() {
		return userInfoDao.AllUserEmail();
	}

	@Override
	public Map<String, Object> selectViewByUserNo(int userNo) {
		return userInfoDao.selectViewByUserNo(userNo);
	}
	
}
