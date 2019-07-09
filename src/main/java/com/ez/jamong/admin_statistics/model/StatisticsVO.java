package com.ez.jamong.admin_statistics.model;

public class StatisticsVO {
	private String categoryName;
	private int categoryCount;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryCount() {
		return categoryCount;
	}
	public void setCategoryCount(int categoryCount) {
		this.categoryCount = categoryCount;
	}
	@Override
	public String toString() {
		return "StatisticsVO [categoryName=" + categoryName + ", categoryCount=" + categoryCount + "]";
	}
	
	
	
}
