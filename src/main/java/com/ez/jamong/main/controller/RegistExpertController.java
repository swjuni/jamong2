package com.ez.jamong.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/registExpert")
public class RegistExpertController {
	private Logger logger=LoggerFactory.getLogger(RegistExpertController.class);
	
	@RequestMapping("/registExpert.do")
	public String registExpert(@RequestParam(defaultValue = "0") int userNo) {
		logger.info("전문가로 전환 페이지 파라미터 userNo={}",userNo);
		return "main/mypage/regist_expert";
	}
}
