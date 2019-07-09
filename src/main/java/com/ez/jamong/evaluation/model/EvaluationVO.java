package com.ez.jamong.evaluation.model;

import java.sql.Timestamp;

public class EvaluationVO {
	private int evalNo;
	private int productNo;
	private int evalScore;
	private String review;
	private Timestamp col;
	private int userNo;
	
	public int getEvalNo() {
		return evalNo;
	}
	public void setEvalNo(int evalNo) {
		this.evalNo = evalNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getEvalScore() {
		return evalScore;
	}
	public void setEvalScore(int evalScore) {
		this.evalScore = evalScore;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Timestamp getCol() {
		return col;
	}
	public void setCol(Timestamp col) {
		this.col = col;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "EvaluationVO [evalNo=" + evalNo + ", productNo=" + productNo + ", evalScore=" + evalScore + ", review="
				+ review + ", col=" + col + ", userNo=" + userNo + "]";
	}
	
	
}
