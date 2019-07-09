package com.ez.jamong.userInfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.common.SearchVO;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired private UserInfoDAO userInfoDao;

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
	
}
