package com.ez.jamong.faq.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.faq.model.FaqCategoryVO;
import com.ez.jamong.faq.model.FaqService;
import com.ez.jamong.faq.model.FaqVO;

@Controller
@RequestMapping("/main/faq")
public class FaqServiceController {
	private Logger logger = LoggerFactory.getLogger(FaqServiceController.class);
	@Autowired private FaqService faqService;

	
	@RequestMapping("/faqServiceList.do")
	public String faqServiceList_get(@RequestParam(defaultValue = "1") int faqCateNo, Model model) {
		logger.info("서비스 FAQ 화면 요청");
		
		List<FaqCategoryVO> catList = faqService.selectCateAll();
		logger.info("카테고리목록 조회 결과 catList.size={}", catList.size());
		
		List<FaqVO> list = faqService.selectAll(faqCateNo);
		logger.info("FAQ목록 요청 결과 cList.size={}",list.size());
		
		model.addAttribute("catList", catList);
		model.addAttribute("cList", list);

		return "main/faq/faq";
	}

	
}
