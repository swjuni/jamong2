package com.ez.jamong.admin.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.admin_statistics.model.StatisticsService;
import com.ez.jamong.admin_statistics.model.StatisticsVO;

@Controller
public class StatisticsAdminController {
	private Logger logger = LoggerFactory.getLogger(LoginAdminController.class);
	
	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping("/admin/statistics/User_statistics.do")
	public String loginAdmin(Model model, HttpSession session) {
		logger.info("카테고리,회원 통계 화면");
		
		int pro = statisticsService.selectPro();
		int user = statisticsService.selectUser();
		int mem = user-pro;
		logger.info("전문가 회원 파라미터={}, 회원 파라미터={}",pro,mem);
		
		List<StatisticsVO> list = statisticsService.selectCategotyMenuCount();
		logger.info("카테고리 별 list.size={}",list.size());
		
		model.addAttribute("pro", pro);
		model.addAttribute("mem", mem);
		model.addAttribute("list",list);
		
		return "admin/statistics/User_statistics";
	}
}

