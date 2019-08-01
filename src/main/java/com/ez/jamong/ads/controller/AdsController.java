package com.ez.jamong.ads.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.ads.model.AdsService;
import com.ez.jamong.ads.model.AdsVO;

@Controller
public class AdsController {
	@Autowired
	private AdsService adsService;
	
	Logger logger = LoggerFactory.getLogger(AdsController.class);
	
	@RequestMapping("/admin/manage/AgreeAds.do")
	public String AgreeAds(Model model) {
		logger.info("기간 내 활성화 배너 띄우기");
		List<AdsVO> list = adsService.AgreeAds();
		
		logger.info("list.size={}",list);
		model.addAttribute("list", list);
		
		return "admin/manage/AgreeAds";
	}
	
}
