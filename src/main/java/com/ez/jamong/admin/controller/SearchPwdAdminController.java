package com.ez.jamong.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;

@Controller
public class SearchPwdAdminController {
	private Logger logger = LoggerFactory.getLogger(SearchPwdAdminController.class);
	
	@Autowired private AdminService adminService;
	
	//암호화 인코더
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@RequestMapping("/admin/login/SearchPwd.do") 
	public String searchPwd() {
		logger.info("������ ��й�ȣ ã�� ������");
		return "admin/login/SearchPwd";
	}
	
	@RequestMapping("/admin/login/changePwd.do")
	public String changePwd() {
		logger.info("비밀번호 변경 페이지 보여주기");
		return "admin/login/changePwd";
	}
	
	@RequestMapping(value = "/admin/login/changePwd.do",method=RequestMethod.POST)
	public String changPwd_POST(@RequestParam String nowPwd,
			@RequestParam String afterPWd,
			HttpServletRequest request,
			Model model) {
		logger.info("관리자 비밀번호 변경 파라미터 nowPwd={}, afterPWd={}", nowPwd, afterPWd);
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("adminId");
		logger.info("세션 adminId={}",userid);
		
		AdminVO aftervo = new AdminVO();
		aftervo.setAdminId(userid);
		aftervo.setAdminPwd(afterPWd);
		String msg="",url="/admin/login/changePwd.do";
		int result=adminService.changeAdminPwd(userid,nowPwd, aftervo);
		if(result==AdminService.EMPTY_PWD) {
			msg="비밀번호를 입력하세요";
		}else if(result == AdminService.MISS_PWD) {
			msg="비밀번호가 틀렸습니다";
		}else {
			msg="비밀번호 변경 성공!";
			url="/admin/index_admin.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
}