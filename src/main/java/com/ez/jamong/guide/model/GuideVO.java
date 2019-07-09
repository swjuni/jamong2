package com.ez.jamong.guide.model;

public class GuideVO {
	private int guideNo;
	private String pageName;
	private String content;
	private int adminNo;
	  
	public int getGuideNo() {
		return guideNo;
	}
	public void setGuideNo(int guideNo) {
		this.guideNo = guideNo;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	@Override
	public String toString() {
		return "GuideVO [guideNo=" + guideNo + ", pageName=" + pageName + ", content=" + content + ", adminNo="
				+ adminNo + "]";
	}
	  
	  
}
