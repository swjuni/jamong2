package com.ez.jamong.userInfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.userInfo.model.UserInfoService;

@Controller
@RequestMapping("/main/userlogin")
public class UserInfoController {
	private Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	UserInfoService userInfoService;
	
	@RequestMapping("/login.do")
	public String loginUser() {
		logger.info("로그인 페이지 뷰");
		return "/main/userlogin/login";
	}
	
	@RequestMapping("/userRegist.do")
	public String registUser() {
		logger.info("회원가입 페이지 뷰");
		return "/main/userlogin/userRegist";
	}
}

