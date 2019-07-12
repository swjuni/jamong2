package com.ez.jamong.admin.model;

import java.util.List;

public interface AdminDAO {
	public String selectForAdminLogin(String userid);
	public AdminVO selectAdmin(String userid);
	public List<AdminVO> selectAdminAll();
	public int gradeAdminUpdate(AdminVO vo);
	public int insertAdmin(AdminVO vo);
	public int deleteAdmin(String id);
	
}
