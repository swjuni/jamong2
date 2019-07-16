package com.ez.jamong.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class ErrorController {
	private Logger logger=LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping("/404error.do")
	public String error() {
		logger.info("404페이지 요청");
		return "main/incs/404code";
	}
}
