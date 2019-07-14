package com.ez.jamong.announcce.model;

import java.sql.Timestamp;

public class AnnouncceVO {
	private int announceNo; //ANNOUNCE_NO(PK)	NUMBER	공지사항번호(PK)
	private String title; //TITLE	VARCHAR2(100)	제목
	private String content;	//CONTENT	CLOB	내용
	private String fileName;	//FILE_NAME	VARCHAR2(100)	파일명
	private String originalFileName;	//ORIGINAL_FILE_NAME	VARCHAR2(100)	원본파일명
	private long fileSize;	//FILE_SIZE	NUMBER	파일사이즈
	private int readCount;	//READ_COUNT	NUMBER	조회수
	private Timestamp regDate;	//REGDATE	TIMESTAMP	작성일
	private String delFalg;	//DELFLAG	VARCHAR2(50)	삭제여부
	private int adminNo;	//ADMIN_NO(FK)	NUMBER	관리자번호(FK)
	
	//24시간 이내의 글인 경우 image표시하기 위해 사용
	private double newImgTerm;
	
	//이전글, 다음글인 경우 표시하기 위해 사용
	private int nextNo;
	private int preNo;
	private String nextTitle;
	private String preTitle;
	
	public int getNextNo() {
		return nextNo;
	}
	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}
	public int getPreNo() {
		return preNo;
	}
	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public double getNewImgTerm() {
		return newImgTerm;
	}
	public void setNewImgTerm(double newImgTerm) {
		this.newImgTerm = newImgTerm;
	}
	
	public int getAnnounceNo() {
		return announceNo;
	}
	public void setAnnounceNo(int announceNo) {
		this.announceNo = announceNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getDelFalg() {
		return delFalg;
	}
	public void setDelFalg(String delFalg) {
		this.delFalg = delFalg;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	@Override
	public String toString() {
		return "AnnouncceVO [announceNo=" + announceNo + ", title=" + title + ", content=" + content + ", fileName="
				+ fileName + ", originalFileName=" + originalFileName + ", fileSize=" + fileSize + ", readCount="
				+ readCount + ", regDate=" + regDate + ", delFalg=" + delFalg + ", adminNo=" + adminNo + ", newImgTerm="
				+ newImgTerm + ", nextNo=" + nextNo + ", preNo=" + preNo + ", nextTitle=" + nextTitle + ", preTitle="
				+ preTitle + "]";
	}

	

}
