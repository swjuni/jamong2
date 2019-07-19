package com.ez.jamong.admin.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin_statistics.model.StatisticsService;
import com.ez.jamong.admin_statistics.model.StatisticsVO;

@Controller
public class StatisticsAdminController {
	private Logger logger = LoggerFactory.getLogger(StatisticsAdminController.class);
	
	@Autowired
	private StatisticsService statisticsService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin/statistics/User_statistics.do")
	public String loginAdmin(Model model, HttpSession session) {
		logger.info("카테고리,회원 통계 화면 회원/전문가 수 넘겨주기");
		
		int pro = statisticsService.selectPro();
		int user = statisticsService.selectUser();
		int mem = user-pro;
		logger.info("전문가 회원 파라미터={}, 회원 파라미터={}",pro,mem);
		
		model.addAttribute("pro", pro);
		model.addAttribute("mem", mem);
		
		return "admin/statistics/User_statistics";
	}
	
	@RequestMapping("/admin/statistics/User_statistics1.do")
	@ResponseBody
	public Object loginAdmin1(Model model, HttpSession session) {
		logger.info("카테고리,회원 통계 화면 카테고리 데이터 넘겨주기");
		List<StatisticsVO> list = statisticsService.selectCategotyMenuCount();
		
		String[] arrName = new String[list.size()];
		Integer[] arrCount = new Integer[list.size()];
		for(int i=0;i<list.size();i++) {
			arrName[i]=list.get(i).getCategoryName();
			arrCount[i]=list.get(i).getCategoryCount();
			logger.info("카테고리별 이름 : "+arrName[i]);
			logger.info("카테고리별 개수 : "+arrCount[i]);
		}
		Object[] obj = new Object[2];
		obj[0]=arrName;
		obj[1]=arrCount;
		
		return obj;
	}
	
	//관리자 메인페이지 매출액, 신규회원, 상품개수 데이터
	@RequestMapping("/admin/index_adminData.do")
	@ResponseBody
	public int[] MainPageData() {
		logger.info("메인페이지 데이터 매출,신규회원,상품개수");
		int[] list = adminService.mainPageData();
		logger.info("list.size={}",list.length);
		
		return list;
	}
	
	
	//지역별 회원수 ajax로 구현
	@RequestMapping("/admin/locationUser.do")
	@ResponseBody
	public int[] locationUserList() {
		logger.info("메인페이지 데이터, 지역별 회원수");
		int[] list = adminService.locationUserList();
		logger.info("list.size={}",list.length);
		
		return list;
	}
}

