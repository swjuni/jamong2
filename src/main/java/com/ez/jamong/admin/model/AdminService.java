package com.ez.jamong.admin.model;

import java.util.List;

public interface AdminService{
	
	//아이디 중복확인에서 사용하는 final변수
	public static final int USEFUL_USERID=1;  //사용가능한 아이디
	public static final int NON_USEFUL_USERID=2;  //사용불가능한 아이디
			
	//로그인처리에서 사용하는 final 변수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
	
	//비밀변호 변경에서 사용하는 final변수
	public static final int MISS_PWD=3;
	public static final int EMPTY_PWD=2;
	
	public int adminLoginCheck(String userid,String pwd);
	public AdminVO selectAdmin(String userid);
	public List<AdminVO> selectAdminAll();
	public int gradeAdminUpdate(AdminVO vo);
	public int insertAdmin(AdminVO vo);
	public int deleteAdmin(String id);
	public int changeAdminPwd(String userid,String nowPwd, AdminVO aftervo);
	public int[] mainPageData();
	//지역별 회원
	public int[] locationUserList();
}
