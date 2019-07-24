package com.ez.jamong.message.model;

import java.sql.Timestamp;

public class MessageVO {
	
	private int messageNo;
	private String userId;//보낸아이디
	private String userId2;//받는아이디
	private String contents;//내용
	private String trash;//휴지통 여부
	private String fileName;
	private String originalFileName;
	private long fileSize;
	private Timestamp regdate;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId2() {
		return userId2;
	}
	public void setUserId2(String userId2) {
		this.userId2 = userId2;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTrash() {
		return trash;
	}
	public void setTrash(String trash) {
		this.trash = trash;
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	@Override
	public String toString() {
		return "MessageVO [messageNo=" + messageNo + ", userId=" + userId + ", userId2=" + userId2 + ", contents="
				+ contents + ", trash=" + trash + ", fileName=" + fileName + ", originalFileName=" + originalFileName
				+ ", fileSize=" + fileSize + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
}
