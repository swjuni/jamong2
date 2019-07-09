package com.ez.jamong.admin.model;

public class AdminVO {
	//admin
	private int adminNo;
	private String adminId;
	private String adminPwd;
	private String adminName;
	private int authorNo;
	
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public int getAuthorNo() {
		return authorNo;
	}
	public void setAuthorNo(int authorNo) {
		this.authorNo = authorNo;
	}
	@Override
	public String toString() {
		return "AdminVO [adminNo=" + adminNo + ", adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName="
				+ adminName + ", authorNo=" + authorNo + "]";
	}
	
	
}
