package com.ez.jamong.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsSalesController {
	private Logger logger = LoggerFactory.getLogger(LoginAdminController.class);
	
	@RequestMapping("/admin/statistics/Sales_statistics.do") 
	public String loginAdmin() {
		logger.info("�α��� ������");
		return "admin/statistics/Sales_statistics";
	}
}

