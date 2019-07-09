package com.ez.jamong.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.Author.model.AuthorService;
import com.ez.jamong.Author.model.AuthorVO;

@Controller
@RequestMapping("/admin/manage")
public class GradeManageController {
	private Logger logger = LoggerFactory.getLogger(GradeManageController.class);
	
	@Autowired
	private AuthorService admingradeService;
	
	@RequestMapping("/grade.do") 
	public String gradeManage(Model model) {
		logger.info("등급관리 화면");
		
		List<AuthorVO> list1 = admingradeService.selectAutorityAll("관리자");
		List<AuthorVO> list2 = admingradeService.selectAutorityAll("전문가");
		List<AuthorVO> list3 = admingradeService.selectAutorityAll("일반회원");
		
		logger.info("관리자 등급 개수 : "+Integer.toString(list1.size()));
		logger.info("전문가 등급 개수 : "+Integer.toString(list2.size()));
		logger.info("일반회원 등급 개수 : "+Integer.toString(list2.size()));
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		
		return "/admin/manage/grade";
	}
	
	
	@RequestMapping("/grade_regist.do")
	public String gradeManage_regist(@ModelAttribute AuthorVO admingradeVo, Model model) {
		logger.info("등급관리 화면 파라미터 admingradeVo={}",admingradeVo);
		
		//insert처리
		
		
		return "/admin/manage/grade";
	}
	
}
