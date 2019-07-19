package com.ez.jamong.admin.model;


//지역별 회원수 통계에 쓰일 일회성 VO
public class LocationVO {
	private String location;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "LocationVO [location=" + location + "]";
	}
	
}
