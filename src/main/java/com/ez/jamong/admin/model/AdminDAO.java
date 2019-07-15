package com.ez.jamong.admin.model;

import java.util.List;

public interface AdminDAO {
	public String selectForAdminLogin(String userid);
	public AdminVO selectAdmin(String userid);
	public List<AdminVO> selectAdminAll();
	public int gradeAdminUpdate(AdminVO vo);
	public int insertAdmin(AdminVO vo);
	public int deleteAdmin(String id);
	public int updateAdminPwd(AdminVO vo);
	
	//메인화면 총매출,신규회원,상품개수
	public int selectSumPay();
	public int selectNewUser();
	public int selectCountMenu();
}
