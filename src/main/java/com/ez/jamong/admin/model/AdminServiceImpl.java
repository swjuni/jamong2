package com.ez.jamong.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired private AdminDAO adminDao;
	
	//암호화 인코더
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public int adminLoginCheck(String userid, String pwd) {
		String dbPwd = adminDao.selectForAdminLogin(userid);
		
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=AdminService.ID_NONE;
		}else{
			if(encoder.matches(pwd, dbPwd)) {
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
	public List<Map<String, Object>> selectAdminAll() {
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
	public int changeAdminPwd(String userid,String nowPwd, AdminVO aftervo) {
		int cnt=0;
		AdminVO now = adminDao.selectAdmin(userid);
		if(!encoder.matches(nowPwd, now.getAdminPwd())) {
			cnt=AdminService.MISS_PWD;
		}
		else if(aftervo.getAdminPwd().isEmpty() || aftervo.getAdminPwd()==null) {
			cnt=AdminService.EMPTY_PWD;
		}else {
			aftervo.setAdminPwd(encoder.encode(aftervo.getAdminPwd()));
			cnt=adminDao.updateAdminPwd(aftervo);
			System.out.println("비밀번호 변경 가능");
		}
		
		
		return cnt;
	}

	@Override
	public int[] mainPageData() {
		int a = 0;
		int b = 0;
		int c = 0;
		a=adminDao.selectSumPay();
		b=adminDao.selectNewUser();
		c=adminDao.selectCountMenu();
		
		int[] list = new int[3];
	
		
		list[0]=a;
		list[1]=b;
		list[2]=c;
		
		return list;
	}

	@Override
	public int[] locationUserList() {
		String[] location= {"서울","경기","인천","강원","충북","충남",
				"대전","광주","전북","전남","경북","경남","대구","부산","울산","제주"};
		int[] list=new int[location.length];
		for(int i=0;i<location.length;i++) {
			list[i]=adminDao.locationUser(location[i]);
		}
		return list;
	}
	
	
}
