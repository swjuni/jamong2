package com.ez.jamong.files.model;

import java.sql.Timestamp;

public class FilesVO {
	private int filesNo;
	private String filesName;
	private String originalFileName;
	private String filesSize;
	private int orderNo;
	public int getFilesNo() {
		return filesNo;
	}
	public void setFilesNo(int filesNo) {
		this.filesNo = filesNo;
	}
	public String getFilesName() {
		return filesName;
	}
	public void setFilesName(String filesName) {
		this.filesName = filesName;
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
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "FilesVO [filesNo=" + filesNo + ", filesName=" + filesName + ", originalFileName=" + originalFileName
				+ ", filesSize=" + filesSize + ", orderNo=" + orderNo + "]";
	} 
	
	
}
