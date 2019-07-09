package com.ez.jamong.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAdminController {
	private static final Logger logger = LoggerFactory.getLogger(IndexAdminController.class);
	
	@RequestMapping("/admin/index_admin.do")
	public String indexAdmin() {
		logger.info("관리자 인덱스 화면 요청하기");
		return "admin/index_admin";
	}
}
