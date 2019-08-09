package com.ez.jamong.admin.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
	public String selectForAdminLogin(String userid);
	public AdminVO selectAdmin(String userid);
	public List<Map<String, Object>> selectAdminAll();
	public int gradeAdminUpdate(AdminVO vo);
	public int insertAdmin(AdminVO vo);
	public int deleteAdmin(String id);
	public int updateAdminPwd(AdminVO vo);
	
	//메인화면 총매출,신규회원,상품개수
	public int selectSumPay();
	public int selectNewUser();
	public int selectCountMenu();
	
	//지역별 회원
	public int locationUser(String location);
}
