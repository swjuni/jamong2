package com.ez.jamong.announcce.model;

import java.util.List;

public class AnnouncceListVO {
	private List<AnnouncceVO> announcceItems;

	public List<AnnouncceVO> getAnnouncceItems() {
		return announcceItems;
	}

	public void setAnnouncceItems(List<AnnouncceVO> announcceItems) {
		this.announcceItems = announcceItems;
	}

	@Override
	public String toString() {
		return "AnnouncceListVO [announcceItems=" + announcceItems + "]";
	}

	
}
