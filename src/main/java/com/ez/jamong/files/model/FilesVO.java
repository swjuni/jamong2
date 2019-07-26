package com.ez.jamong.files.model;

import java.sql.Timestamp;

public class FilesVO {
	private int productNo;
	private String productName;
	private int filesNo;
	private String fileName;
	private String originalFileName;
	private String filesSize;
	private int userNo;
	private Timestamp orderDate;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getFilesNo() {
		return filesNo;
	}
	public void setFilesNo(int filesNo) {
		this.filesNo = filesNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getFilesSize() {
		return filesSize;
	}
	public void setFilesSize(String filesSize) {
		this.filesSize = filesSize;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
	public String toString() {
		return "FilesVO [productNo=" + productNo + ", productName=" + productName + ", filesNo=" + filesNo
				+ ", fileName=" + fileName + ", originalFileName=" + originalFileName + ", filesSize=" + filesSize
				+ ", userNo=" + userNo + ", orderDate=" + orderDate + "]";
	}
	
	
	
	
}
