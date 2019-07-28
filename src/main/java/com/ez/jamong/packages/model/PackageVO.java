package com.ez.jamong.packages.model;

public class PackageVO {
	  private int packNo;
	  private String packLevel;
	  private int packPrice;
	  private String packName;
	  private String packDesc;
	  private int workingPeriod;
	  private int modifyCount;
	  private int productNo;
	public int getPackNo() {
		return packNo;
	}
	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	public String getPackLevel() {
		return packLevel;
	}
	public void setPackLevel(String packLevel) {
		this.packLevel = packLevel;
	}
	public int getPackPrice() {
		return packPrice;
	}
	public void setPackPrice(int packPrice) {
		this.packPrice = packPrice;
	}
	public String getPackName() {
		return packName;
	}
	public void setPackName(String packName) {
		this.packName = packName;
	}
	public String getPackDesc() {
		return packDesc;
	}
	public void setPackDesc(String packDesc) {
		this.packDesc = packDesc;
	}
	public int getWorkingPeriod() {
		return workingPeriod;
	}
	public void setWorkingPeriod(int workingPeriod) {
		this.workingPeriod = workingPeriod;
	}
	public int getModifyCount() {
		return modifyCount;
	}
	public void setModifyCount(int modifyCount) {
		this.modifyCount = modifyCount;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	@Override
	public String toString() {
		return "PackageVO [packNo=" + packNo + ", packLevel=" + packLevel + ", packPrice=" + packPrice + ", packName="
				+ packName + ", packDesc=" + packDesc + ", workingPeriod=" + workingPeriod + ", modifyCount="
				+ modifyCount + ", productNo=" + productNo + "]";
	}

}
