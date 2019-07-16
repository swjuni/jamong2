package com.ez.jamong.guide.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.guide.model.GuideService;
import com.ez.jamong.guide.model.GuideVO;

@Controller
@RequestMapping("/main/guide")
public class GuideServiceController {
	private Logger logger = LoggerFactory.getLogger(GuideServiceController.class);
	@Autowired private GuideService guideService;
	
	@RequestMapping(value = "/guideIntro.do")
	public String guideDetail_get(@RequestParam(defaultValue = "0") int guideNo, Model model) {
		logger.info("서비스 안내 페이지 상세보기 요청, 파라미터 guideNo={}", guideNo);
		
		if(guideNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index_main.do");
			
			return "common/message";
		}
		
		GuideVO guideVo=guideService.selectByNo(guideNo);
		logger.info("상세보기 결과 vo={}", guideVo);
		
		model.addAttribute("vo", guideVo);
		
		return "main/faq/guide";
	}
	
	@RequestMapping(value = "/guideList_bottom.do")
	public String guideList(Model model) {
		logger.info("bottom guideList 요청");
		List<GuideVO> list = guideService.selectAll();
		logger.info("guide전체 목록 요청 결과 list={}",list);
		
		model.addAttribute("list", list);
		
		return "main/incs/guideList_bottom";
	}
	
	@RequestMapping("/contact.do")
	public String contact() {
		logger.info("bottom contact 요청");
		return "main/announcce/contact";
	}
	
}
