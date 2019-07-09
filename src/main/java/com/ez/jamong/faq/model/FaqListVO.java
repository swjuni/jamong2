package com.ez.jamong.faq.model;

import java.util.List;

public class FaqListVO {
	public List<FaqVO> faqItems;

	public List<FaqVO> getFaqItems() {
		return faqItems;
	}

	public void setFaqItems(List<FaqVO> faqItems) {
		this.faqItems = faqItems;
	}

	@Override
	public String toString() {
		return "FaqListVO [faqItems=" + faqItems + "]";
	}
	
}
