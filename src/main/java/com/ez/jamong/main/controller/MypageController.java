package com.ez.jamong.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		logger.info("마이페이지 요청");
		return "main/mypage/mypage_main";
	}
	
	@RequestMapping("/userInfo.do")
	public String userInfo() {
		logger.info("userInfo(나의정보) 요청");
		return "main/mypage/user_info";
	}
	
}
