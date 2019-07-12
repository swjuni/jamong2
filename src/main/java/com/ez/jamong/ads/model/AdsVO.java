package com.ez.jamong.ads.model;

import java.sql.Timestamp;

public class AdsVO {
	private int adsNo;
	private int expertNo;
	private int categoryNo;
	private int requestPeriod;
	private Timestamp startDate;
	private Timestamp endDate;
	private int price;
	private String fileName;
	private String originalFileName;
	private int fileSize;
	private String approveDelflag;
	private String activation;
	private int adminNo;
	public int getAdsNo() {
		return adsNo;
	}
	public void setAdsNo(int adsNo) {
		this.adsNo = adsNo;
	}
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getRequestPeriod() {
		return requestPeriod;
	}
	public void setRequestPeriod(int requestPeriod) {
		this.requestPeriod = requestPeriod;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getApproveDelflag() {
		return approveDelflag;
	}
	public void setApproveDelflag(String approveDelflag) {
		this.approveDelflag = approveDelflag;
	}
	public String getActivation() {
		return activation;
	}
	public void setActivation(String activation) {
		this.activation = activation;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	@Override
	public String toString() {
		return "AdsVO [adsNo=" + adsNo + ", expertNo=" + expertNo + ", categoryNo=" + categoryNo + ", requestPeriod="
				+ requestPeriod + ", startDate=" + startDate + ", endDate=" + endDate + ", price=" + price
				+ ", fileName=" + fileName + ", originalFileName=" + originalFileName + ", fileSize=" + fileSize
				+ ", approveDelflag=" + approveDelflag + ", activation=" + activation + ", adminNo=" + adminNo + "]";
	}
	
	
}
