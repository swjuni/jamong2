package com.ez.jamong.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;

@Controller
@RequestMapping("/admin")
public class SubAdminManageController {
	private Logger logger = LoggerFactory.getLogger(SubAdminManageController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/manage/sub_admin.do")
	public String gradeManage(Model model) {
		logger.info("등급관리 화면");
		
		List<AdminVO> list = adminService.selectAdminAll();
		
		logger.info("등급관리 화면 관리자 list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "/admin/manage/sub_admin";
	}
}