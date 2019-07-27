package com.ez.jamong.menuInfo.model;

import com.ez.jamong.common.SearchVO;

public class MenuInfoSearchVO extends SearchVO{
	private int categoryNoL;
	private int categoryNoM;
	private int expertNo;
	private int authorNo;
	private int tagNo;

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getCategoryNoM() {
		return categoryNoM;
	}

	public void setCategoryNoM(int categoryNoM) {
		this.categoryNoM = categoryNoM;
	}

	public int getAuthorNo() {
		return authorNo;
	}

	public void setAuthorNo(int authorNo) {
		this.authorNo = authorNo;
	}

	public int getExpertNo() {
		return expertNo;
	}

	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}

	public int getCategoryNoL() {
		return categoryNoL;
	}

	public void setCategoryNoL(int categoryNoL) {
		this.categoryNoL = categoryNoL;
	}

	@Override
	public String toString() {
		return "MenuInfoSearchVO [categoryNoL=" + categoryNoL + ", categoryNoM=" + categoryNoM + ", expertNo="
				+ expertNo + ", authorNo=" + authorNo + ", tagNo=" + tagNo + ", toString()=" + super.toString() + "]";
	}

}
