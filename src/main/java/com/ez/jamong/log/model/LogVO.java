package com.ez.jamong.log.model;

import java.sql.Timestamp;

public class LogVO {
	private int logsNo;
	private int userNo;
	private String loginIp;
	private String loginOs;
	private Timestamp loginTime;
	public int getLogsNo() {
		return logsNo;
	}
	public void setLogsNo(int logsNo) {
		this.logsNo = logsNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public String getLoginOs() {
		return loginOs;
	}
	public void setLoginOs(String loginOs) {
		this.loginOs = loginOs;
	}
	public Timestamp getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}
	@Override
	public String toString() {
		return "LogVO [logsNo=" + logsNo + ", userNo=" + userNo + ", loginIp=" + loginIp + ", loginOs=" + loginOs
				+ ", loginTime=" + loginTime + "]";
	}
	
	
}
