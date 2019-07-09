package com.ez.jamong.report.model;

import java.sql.Timestamp;

public class ReportVO {
	private int reportNo;
	private String reportDesc;
	private Timestamp reportDate;
	private String delflag;
	private int userNo;
	private int expertNo;
	private int productNo;
	private int adminNo;
	private String reportType;
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportDesc() {
		return reportDesc;
	}
	public void setReportDesc(String reportDesc) {
		this.reportDesc = reportDesc;
	}
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportDesc=" + reportDesc + ", reportDate=" + reportDate
				+ ", delflag=" + delflag + ", userNo=" + userNo + ", expertNo=" + expertNo + ", productNo=" + productNo
				+ ", adminNo=" + adminNo + ", reportType=" + reportType + "]";
	}
	
}
