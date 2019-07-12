package com.ez.jamong.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired private AdminDAO adminDao;
	
	@Override
	public int adminLoginCheck(String userid, String pwd) {
		String dbPwd = adminDao.selectForAdminLogin(userid);
		
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=AdminService.ID_NONE;
		}else{
			if(dbPwd.equals(pwd)) {
				result=AdminService.LOGIN_OK;
			}else {
				result=AdminService.PWD_DISAGREE;
			}
		}
		return result;
	}

	@Override
	public AdminVO selectAdmin(String userid) {
		return adminDao.selectAdmin(userid);
	}

	@Override
	public List<AdminVO> selectAdminAll() {
		return adminDao.selectAdminAll();
	}

	@Override
	public int gradeAdminUpdate(AdminVO vo) {
		return adminDao.gradeAdminUpdate(vo);
	}
	
	@Override
	public int insertAdmin(AdminVO vo) {
		return adminDao.insertAdmin(vo);
	}

	@Override
	public int deleteAdmin(String id) {
		return adminDao.deleteAdmin(id);
	}
	
}
