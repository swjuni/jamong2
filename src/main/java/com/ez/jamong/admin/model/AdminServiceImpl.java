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

	@Override
	public int changeAdminPwd(String userid, AdminVO aftervo) {
		int cnt=0;
		AdminVO now = adminDao.selectAdmin(userid);
		if(!now.getAdminPwd().equals(aftervo.getAdminPwd())) {
			cnt=AdminService.MISS_PWD;
		}
		if(now.getAdminPwd().isEmpty() || now.getAdminPwd()==null) {
			cnt=AdminService.EMPTY_PWD;
			return cnt;
		}else {
			cnt=adminDao.updateAdminPwd(aftervo);
			System.out.println("비밀번호 변경 가능");
		}
		return cnt;
	}
	
}
