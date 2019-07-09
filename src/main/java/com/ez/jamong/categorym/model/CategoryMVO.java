package com.ez.jamong.categorym.model;

public class CategoryMVO {
	private int categoryNoM;
	private int categoryNoL;
	private String categoryName;
	private String categoryDesc;
	private String imgName;
	private String imgOriginalName;
	private long imgSize;
	
	
	
	
	
	public int getCategoryNoM() {
		return categoryNoM;
	}
	public void setCategoryNoM(int categoryNoM) {
		this.categoryNoM = categoryNoM;
	}
	public int getCategoryNoL() {
		return categoryNoL;
	}
	public void setCategoryNoL(int categoryNoL) {
		this.categoryNoL = categoryNoL;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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
		return "CategoryMVO [categoryNoM=" + categoryNoM + ", categoryNoL=" + categoryNoL + ", categoryName="
				+ categoryName + ", categoryDesc=" + categoryDesc + ", imgName=" + imgName + ", imgOriginalName="
				+ imgOriginalName + ", imgSize=" + imgSize + "]";
	}
	
	
	
	

	
}
