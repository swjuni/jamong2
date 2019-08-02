package com.ez.jamong.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;

@Controller
@RequestMapping("/admin")
public class SubAdminManageController {
	private Logger logger = LoggerFactory.getLogger(SubAdminManageController.class);
	
	@Autowired
	private AdminService adminService;
	
	//암호화 인코더
		private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	@RequestMapping("/manage/sub_admin.do") 
	public String gradeManage(Model model) {
		logger.info("등급관리 화면");
		
		List<AdminVO> list = adminService.selectAdminAll();
		
		logger.info("등급관리 화면 관리자 list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "/admin/manage/sub_admin";
	}
	
	@RequestMapping("/manage/sub_admin_update.do")
	@ResponseBody
	public int gradeAdminUpdate(@ModelAttribute AdminVO vo) {
		logger.info("부관리자 수정 vo={}",vo);
		vo.setAdminPwd(encoder.encode(vo.getAdminPwd()));
		int cnt = adminService.gradeAdminUpdate(vo);
		logger.info("부관리자 수정 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/manage/sub_admin_insert.do")
	@ResponseBody
	public int insertAdmin(@ModelAttribute AdminVO vo) {
		logger.info("부관리자 등록 vo={}",vo);
		vo.setAdminPwd(encoder.encode(vo.getAdminPwd()));
		int cnt = adminService.insertAdmin(vo);
		logger.info("부관리자 등록 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/manage/sub_admin_delete.do")
	@ResponseBody
	public int deleteAdmin(@RequestParam String id) {
		logger.info("부관리자 삭제 id={}",id);
		
		int cnt = adminService.deleteAdmin(id);
		logger.info("부관리자 삭제 cnt={}",cnt);
		
		return cnt;
	}
	
	
}