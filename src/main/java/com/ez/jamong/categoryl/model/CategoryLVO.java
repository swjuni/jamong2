package com.ez.jamong.categoryl.model;

public class CategoryLVO {
	private int categoryNo;
	private String categoryNameL;
	private String categoryDesc;
	private String imgName;
	private String imgOriginalName;
	private long imgSize;
	
	
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryNameL() {
		return categoryNameL;
	}
	public void setCategoryNameL(String categoryNameL) {
		this.categoryNameL = categoryNameL;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgOriginalName() {
		return imgOriginalName;
	}
	public void setImgOriginalName(String imgOriginalName) {
		this.imgOriginalName = imgOriginalName;
	}
	public long getImgSize() {
		return imgSize;
	}
	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}
	
	
	@Override
	public String toString() {
		return "CategoryLVO [categoryNo=" + categoryNo + ", categoryNameL=" + categoryNameL + ", categoryDesc="
				+ categoryDesc + ", imgName=" + imgName + ", imgOriginalName=" + imgOriginalName + ", imgSize="
				+ imgSize + "]";
	}
	
	
	
	
	

	
}
