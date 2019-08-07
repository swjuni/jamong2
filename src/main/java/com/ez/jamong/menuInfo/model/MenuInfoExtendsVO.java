package com.ez.jamong.menuInfo.model;

public class MenuInfoExtendsVO extends MenuInfoVO {
	private String fileName;	//상품의 이미지테이블에서 첫번째 파일명 
	private int categoryNo;	//카테고리 대
	private String categoryNameL; //카테고리 대 이름
	private String categoryName; //카테고리 중 이름
	private String id;	//전문가 id
	private String expertFileName;	//전문가 사진 파일명
	private String packPrice;	//패키지 가격
	
	public String getPackPrice() {
		return packPrice;
	}

	public void setPackPrice(String packPrice) {
		this.packPrice = packPrice;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getExpertFileName() {
		return expertFileName;
	}

	public void setExpertFileName(String expertFileName) {
		this.expertFileName = expertFileName;
	}

	public String getCategoryNameL() {
		return categoryNameL;
	}

	public void setCategoryNameL(String categoryNameL) {
		this.categoryNameL = categoryNameL;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "MenuInfoExtendsVO [fileName=" + fileName + ", categoryNo=" + categoryNo + ", categoryNameL="
				+ categoryNameL + ", categoryName=" + categoryName + ", id=" + id + ", expertFileName=" + expertFileName
				+ ", packPrice=" + packPrice + ", toString()=" + super.toString() + "]";
	}



}
