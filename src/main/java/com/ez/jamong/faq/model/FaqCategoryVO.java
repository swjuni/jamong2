package com.ez.jamong.faq.model;

public class FaqCategoryVO {
	private int faqCateNo;
	private String faqName;
	
	public int getFaqCateNo() {
		return faqCateNo;
	}
	public void setFaqCateNo(int faqCateNo) {
		this.faqCateNo = faqCateNo;
	}
	public String getFaqName() {
		return faqName;
	}
	public void setFaqName(String faqName) {
		this.faqName = faqName;
	}
	@Override
	public String toString() {
		return "FaqCategoryVO [faqCateNo=" + faqCateNo + ", faqName=" + faqName + "]";
	}
	
	
}
