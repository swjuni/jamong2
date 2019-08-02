package com.ez.jamong.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired private ExpertService expertService;
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		logger.info("마이페이지 요청");
		
		return "main/mypage/mypage_main";
	}
	
	@RequestMapping("sideMypage.do")
	public String side(HttpSession session,Model model) {
		int userNo=(Integer)session.getAttribute("userNo");	
		ExpertVO vo=expertService.selectByUserNo(userNo);
		model.addAttribute("expert",vo);
		return "main/incs/side_mypage";
	}
	
}
