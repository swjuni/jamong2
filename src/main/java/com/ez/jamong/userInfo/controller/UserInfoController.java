package com.ez.jamong.userInfo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;
import com.ez.jamong.userInfo.model.UserInfoService;
import com.ez.jamong.userInfo.model.UserInfoVO;

@Controller
@RequestMapping("/main/userlogin")
public class UserInfoController {
	private Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	UserInfoService userInfoService;
	
	@RequestMapping("/login.do")
	public String loginUser() {
		logger.info("로그인 페이지 뷰");
		return "/main/userlogin/login";
	}
	
	@RequestMapping("/userRegist.do")
	public String registUser() {
		logger.info("회원가입 페이지 뷰");
		return "/main/userlogin/userRegist";
	}
	
	@RequestMapping(value="/userRegist.do",method = RequestMethod.POST)
	public String registUser_POST(@ModelAttribute UserInfoVO vo,Model model) {
		logger.info("회원가입 정보 vo={}",vo);
		int cnt = userInfoService.registUser(vo);
		
		logger.info("회원가입 결과 cnt={}",cnt);
		
		String msg="",url="/main/userlogin/userRegist.do";
		if(cnt>0) {
			msg="회원가입 성공!";
			url="/main/userlogin/login.do";
		}else {
			msg="회원가입 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/userCheckId.do")
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		logger.info("아이디 중복 검사 파라미터 id={}",id);
		
		int cnt = userInfoService.existUser(id);
		logger.info("아이디 중복 검사 결과 count cnt={}",cnt);
		
		return cnt;
	}
	
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)  
	public String loginAdmin_get() {
		logger.info("회원 로그인화면 보기");
		
		return "main/userlogin/login";
	}
	
	@RequestMapping(value = "/login.do",method=RequestMethod.POST)
	public String loginAdmin_post(@RequestParam String userId,
			@RequestParam String pwd,
			@RequestParam (required=false) String saveId,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("관리자 로그인 처리 파라미터 userid={}, pwd={}", userId, pwd);
		logger.info("saveId={}",saveId);
		
		int result=userInfoService.userLoginCheck(userId, pwd);
		String msg="",url="/main/userlogin/login.do";
		if(result==userInfoService.LOGIN_OK) {
			UserInfoVO userVo = userInfoService.selectUser(userId);
			
			//세션
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("userName", userVo.getUserName());
			session.setAttribute("userAuthor", userVo.getAuthorNo());
			session.setAttribute("userNo", userVo.getUserNo());
			
			//쿠키
			Cookie ck = new Cookie("ck_userid", userId);
			ck.setPath("/");
			if(saveId!=null) {
				ck.setMaxAge(999*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg = "회원 : "+userVo.getUserName()+"님 환영합니다";
			url="/main/index_main.do";
		}else if(result==UserInfoService.PWD_DISAGREE) {
			msg="비밀번호 불일치";
		}else if(result==UserInfoService.ID_NONE) {
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
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userAuthor");
		session.removeAttribute("userNo");
		
		return "redirect:/main/userlogin/login.do";
	}
}
