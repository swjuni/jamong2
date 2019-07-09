package com.ez.jamong.faq.model;

import java.sql.Timestamp;

public class FaqVO {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private Timestamp faqRegdate;
	private String faqDelflag;
	private int faqCateNo;
	private int adminNo;
	
	private String faqName;
	
	public String getFaqName() {
		return faqName;
	}
	public void setFaqName(String faqName) {
		this.faqName = faqName;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Timestamp getFaqRegdate() {
		return faqRegdate;
	}
	public void setFaqRegdate(Timestamp faqRegdate) {
		this.faqRegdate = faqRegdate;
	}
	public String getFaqDelflag() {
		return faqDelflag;
	}
	public void setFaqDelflag(String faqDelflag) {
		this.faqDelflag = faqDelflag;
	}
	public int getFaqCateNo() {
		return faqCateNo;
	}
	public void setFaqCateNo(int faqCateNo) {
		this.faqCateNo = faqCateNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqRegdate="
				+ faqRegdate + ", faqDelflag=" + faqDelflag + ", faqCateNo=" + faqCateNo + ", adminNo=" + adminNo
				+ ", faqName=" + faqName + "]";
	}
	
	
	
	
}
