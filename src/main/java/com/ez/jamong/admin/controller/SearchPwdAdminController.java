package com.ez.jamong.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchPwdAdminController {
	private Logger logger = LoggerFactory.getLogger(SearchPwdAdminController.class);
	
	@RequestMapping("/admin/login/SearchPwd.do") 
	public String searchPwd() {
		logger.info("������ ��й�ȣ ã�� ������");
		return "admin/login/SearchPwd";
	}
	@RequestMapping("/admin/login/changePwd.do")
	public String changePwd() {
		logger.info("������ ��й�ȣ ã�� ������");
		return "admin/login/changePwd";
	}
}