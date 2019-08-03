package com.ez.jamong.common;

public class DateSearchVO extends SearchVO{
	private String startDay;  //시작일
	private String endDay; //종료일
	private int userNo; //고객번호
	
	private String year;
	private String month;
	
	//getter/setter
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay
				+ ", userNo=" + userNo + ", year=" + year + ", month="
				+ month 
				+ ", currentPage="
				+ getCurrentPage() 
				+ ", firstRecordIndex=" + getFirstRecordIndex()				
				+ ", recordCountPerPage=" + getRecordCountPerPage()
				+ "]";
	}
	
}