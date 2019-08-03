package com.ez.jamong.pay.model;

import java.sql.Timestamp;

public class PayVO {
	private int payNo;
	private int orderNo;
	private String payMethod;
	private int price;
	private Timestamp regdate;
	
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "PayVO [payNo=" + payNo + ", orderNo=" + orderNo + ", payMethod=" + payMethod + ", price=" + price
				+ ", regdate=" + regdate + "]";
	}
	
	
}
