package com.ez.jamong.report.model;

public class ReportExtendsVO extends ReportVO{
	private String id;
	private String productName;
	private String fileName;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Override
	public String toString() {
		return "ReportExtendsVO [id=" + id + ", productName=" + productName + ", fileName=" + fileName + ", toString()="
				+ super.toString() + "]";
	}
}
