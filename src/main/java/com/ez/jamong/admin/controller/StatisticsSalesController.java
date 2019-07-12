package com.ez.jamong.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.menuInfo.model.MenuInfoService;

@Controller
public class StatisticsSalesController {
	private Logger logger = LoggerFactory.getLogger(LoginAdminController.class);
	@Autowired
	MenuInfoService menuInfoService;
	@RequestMapping("/admin/statistics/Sales_statistics.do") 
	public String loginAdmin() {
		logger.info("매출 통계 화면 보여주기");
		return "admin/statistics/Sales_statistics";
	}
	
	@RequestMapping("/admin/statistics/Sales_statistics1.do") 
	@ResponseBody
	public Object loginAdmin1() {
		logger.info("매출 통계 화면에 데이터 넘겨주기");
		
		
		List<Map<String, Object[]>> list = menuInfoService.selectMenuinfoYearCount();
		List<Map<String, Object[]>> list1 = menuInfoService.selectAdsYearCount();
		Object[] obj = new Object[2];
		obj[0]=list;
		obj[1]=list1;
		
		return obj;
	}
}

