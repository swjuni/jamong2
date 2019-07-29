package com.ez.jamong.evalComment.model;

import java.sql.Timestamp;

public class EvalCommentVO {
	private int evalCNo;
	private int evalNo;
	private int userNo;
	private String evalComment;
	private Timestamp regdate;
	private int groupNo;
	private int step;
	private int sortNo;
	private String delflag;
	public int getEvalCNo() {
		return evalCNo;
	}
	public void setEvalCNo(int evalCNo) {
		this.evalCNo = evalCNo;
	}
	public int getEvalNo() {
		return evalNo;
	}
	public void setEvalNo(int evalNo) {
		this.evalNo = evalNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getEvalComment() {
		return evalComment;
	}
	public void setEvalComment(String evalComment) {
		this.evalComment = evalComment;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getSortNo() {
		return sortNo;
	}
	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	@Override
	public String toString() {
		return "EvalCommentVO [evalCNo=" + evalCNo + ", evalNo=" + evalNo + ", userNo=" + userNo + ", evalComment="
				+ evalComment + ", regdate=" + regdate + ", groupNo=" + groupNo + ", step=" + step + ", sortNo="
				+ sortNo + ", delflag=" + delflag + "]";
	}
	
	
	
}
