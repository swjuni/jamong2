package com.ez.jamong.expert.model;

public class ExpertVO {
	private int expertNo;
	private String id;
	private String fileName;
	private String originalFileName;
	private int fileSize;
	private String serviceableTime;
	private int workAmount;
	private String introduction;
	private String etc;
	private String bankName;
	private String accountNo;
	private int userNo;
	
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getServiceableTime() {
		return serviceableTime;
	}
	public void setServiceableTime(String serviceableTime) {
		this.serviceableTime = serviceableTime;
	}
	public int getWorkAmount() {
		return workAmount;
	}
	public void setWorkAmount(int workAmount) {
		this.workAmount = workAmount;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "ExpertVO [expertNo=" + expertNo + ", id=" + id + ", fileName=" + fileName + ", originalFileName="
				+ originalFileName + ", fileSize=" + fileSize + ", serviceableTime=" + serviceableTime + ", workAmount="
				+ workAmount + ", introduction=" + introduction + ", etc=" + etc + ", bankName=" + bankName
				+ ", accountNo=" + accountNo + ", userNo=" + userNo + "]";
	}
	

}
