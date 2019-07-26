package com.ez.jamong.expert_profile.model;

public class ExpertProfileVO {
	private int profileNo;
	private int expertNo;
	private String major;
	private String license;
	private String education;
	private String career;
	public int getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	@Override
	public String toString() {
		return "ExpertProfileVO [profileNo=" + profileNo + ", expertNo=" + expertNo + ", major=" + major + ", license="
				+ license + ", education=" + education + ", career=" + career + "]";
	}
	
}
