package com.ez.jamong.Author.model;

public class AuthorVO {
	private int authorNo;
	private String authorName;
	private String authorDesc;
	private int authorLev;
	
	public int getAuthorNo() {
		return authorNo;
	}
	public void setAuthorNo(int authorNo) {
		this.authorNo = authorNo;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getAuthorDesc() {
		return authorDesc;
	}
	public void setAuthorDesc(String authorDesc) {
		this.authorDesc = authorDesc;
	}
	public int getAuthorLev() {
		return authorLev;
	}
	public void setAuthorLev(int authorLev) {
		this.authorLev = authorLev;
	}
	@Override
	public String toString() {
		return "AdmingradeVO [authorNo=" + authorNo + ", authorName=" + authorName + ", authorDesc=" + authorDesc
				+ ", authorLev=" + authorLev + "]";
	}
	
	
	
}
