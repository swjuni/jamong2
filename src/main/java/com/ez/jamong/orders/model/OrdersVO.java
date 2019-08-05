package com.ez.jamong.orders.model;

import java.sql.Timestamp;

public class OrdersVO {
	private int orderNo;
	private String orderId;
	private Timestamp orderDate;
	private long price;
	private int userNo;
	private int packNo;
	private Timestamp confirmDate;
	private String progress;
	private Timestamp finishDate;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPackNo() {
		return packNo;
	}
	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	public Timestamp getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(Timestamp confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public Timestamp getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Timestamp finishDate) {
		this.finishDate = finishDate;
	}
	
	@Override
	public String toString() {
		return "OrdersVO [orderNo=" + orderNo + ", orderId=" + orderId + ", orderDate=" + orderDate + ", price=" + price
				+ ", userNo=" + userNo + ", packNo=" + packNo + ", confirmDate=" + confirmDate + ", progress="
				+ progress + ", finishDate=" + finishDate + "]";
	}
	
}
