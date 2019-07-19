package com.ez.jamong.bookmark.model;

public class BookmarkVO {
	private int bookmarkNo;
	private int userNo;
	private int expertNo;
	
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	@Override
	public String toString() {
		return "BookmarkVO [bookmarkNo=" + bookmarkNo + ", userNo=" + userNo + ", expertNo=" + expertNo + "]";
	}
	
	
}
