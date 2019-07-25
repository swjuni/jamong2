package com.ez.jamong.report.model;

import com.ez.jamong.common.SearchVO;

public class ReportSearchVO extends SearchVO{
	private int userNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "ReportSearchVO [userNo=" + userNo + ", toString()=" + super.toString() + "]";
	}
	
	
}
