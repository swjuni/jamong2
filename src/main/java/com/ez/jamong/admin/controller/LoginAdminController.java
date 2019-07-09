package com.ez.jamong.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;

@Controller
@RequestMapping("/admin/login")
public class LoginAdminController {
	private Logger logger = LoggerFactory.getLogger(LoginAdminController.class);
	
	@Autowired private AdminService adminService;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)  
	public String loginAdmin_get() {
		logger.info("관리자 로그인화면 보기");
		
		return "admin/login/login";
	}
	
	@RequestMapping(value = "/login.do",method=RequestMethod.POST)
	public String loginAdmin_post(@RequestParam String userid,
			@RequestParam String pwd,
			@RequestParam (required=false) String saveId,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("관리자 로그인 처리 파라미터 userid={}, pwd={}", userid, pwd);
		logger.info("saveId={}",saveId);
		
		int result=adminService.adminLoginCheck(userid, pwd);
		String msg="",url="/admin/login/login.do";
		if(result==AdminService.LOGIN_OK) {
			AdminVO adminVo = adminService.selectAdmin(userid);
			
			//세션
			HttpSession session = request.getSession();
			session.setAttribute("adminUserid", userid);
			session.setAttribute("adminUserName", adminVo.getAdminName());
			
			//쿠키
			Cookie ck = new Cookie("ck_admin_userid", userid);
			ck.setPath("/");
			if(saveId!=null) {
				ck.setMaxAge(999*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg = "관리자 : "+adminVo.getAdminName()+"님 환영합니다";
			url="/admin/index_admin.do";
		}else if(result==AdminService.PWD_DISAGREE) {
			msg="비밀번호 불일치";
		}else if(result==AdminService.ID_NONE) {
			msg="아이디가 존재하지 않습니다";
		}else {
			msg="로그인 처리 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String adminLogout(HttpSession session) {
		logger.info("로그아웃 처리");
		
		session.removeAttribute("adminUserid");
		session.removeAttribute("adminUserName");
		
		return "redirect:/admin/login/login.do";
	}
	

}

