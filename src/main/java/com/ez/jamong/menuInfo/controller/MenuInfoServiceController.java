package com.ez.jamong.menuInfo.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;

@Controller
public class MenuInfoServiceController {
	private Logger logger = LoggerFactory.getLogger(MenuInfoController.class);
	@Autowired private MenuInfoService menuinfoService;
	
	@RequestMapping(value = "/main/menuinfo/menuinfo_Detail.do")
	public String menuinfoDetail_get(@RequestParam(defaultValue = "0") int productNo, HttpServletRequest request, Model model) {
		logger.info("서비스 페이지 상품 상세보기 화면 요청, 파라미터 productNo={}", productNo);
		
		if(productNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index_main.do");
			return "common/message";
		}

		MenuInfoVO menuinfoVo = menuinfoService.selectMenuInfoByNo(productNo);
		logger.info("상세보기 결과 vo={}", menuinfoVo);
		
		if(menuinfoVo.getActivation().equals("N")){
			model.addAttribute("msg", "판매 중지된 상품입니다.");
			model.addAttribute("url", "/main/index_main.do");
			return "common/message";
		}	
		/*
		Map<String, Object> map = menuinfoService.selectMenuinfoView(productNo);
		logger.info("목록 파라미터, map={}", map);
		model.addAttribute("map", map);
		*/
		model.addAttribute("vo", menuinfoVo);
		
		return "main/menuinfo/menuinfo_Detail";
	}
}