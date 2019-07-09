package com.ez.jamong.menuInfo.model;

import java.sql.Timestamp;

public class MenuInfoVO {
	private int productNo;
	private int categoryTypeNo;
	private String productName;
	private int evalScore;
	private String summary;
	private String detailDesc;
	private Timestamp regdate;
	private int orderLevel;
	private String recommend;
	private String activation;
	private int expertNo;
	
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCategoryTypeNo() {
		return categoryTypeNo;
	}
	public void setCategoryTypeNo(int categoryTypeNo) {
		this.categoryTypeNo = categoryTypeNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getEvalScore() {
		return evalScore;
	}
	public void setEvalScore(int evalScore) {
		this.evalScore = evalScore;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDetailDesc() {
		return detailDesc;
	}
	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getOrderLevel() {
		return orderLevel;
	}
	public void setOrderLevel(int orderLevel) {
		this.orderLevel = orderLevel;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getActivation() {
		return activation;
	}
	public void setActivation(String activation) {
		this.activation = activation;
	}
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	
	
	@Override
	public String toString() {
		return "MenuInfoVO [productNo=" + productNo + ", categoryTypeNo=" + categoryTypeNo + ", productName="
				+ productName + ", evalScore=" + evalScore + ", summary=" + summary + ", detailDesc=" + detailDesc
				+ ", regdate=" + regdate + ", orderLevel=" + orderLevel + ", recommend=" + recommend + ", activation="
				+ activation + ", expertNo=" + expertNo + "]";
	}
	
}
