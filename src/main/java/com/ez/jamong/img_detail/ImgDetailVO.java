package com.ez.jamong.img_detail;

public class ImgDetailVO {
	private int detailImgNo;
	private String fileName;
	private String originalFileName;
	private long fileSize;
	private int productNo;
	public int getDetailImgNo() {
		return detailImgNo;
	}
	public void setDetailImgNo(int detailImgNo) {
		this.detailImgNo = detailImgNo;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	@Override
	public String toString() {
		return "ImgDetailVO [detailImgNo=" + detailImgNo + ", fileName=" + fileName + ", originalFileName="
				+ originalFileName + ", fileSize=" + fileSize + ", productNo=" + productNo + "]";
	}
}
