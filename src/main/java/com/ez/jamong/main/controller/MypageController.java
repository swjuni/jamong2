package com.ez.jamong.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.evaluation.model.EvaluationService;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.userInfo.model.UserInfoService;
import com.ez.jamong.userInfo.model.UserInfoVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired private ExpertService expertService;
	@Autowired private EvaluationService evaluationService;
	@Autowired private UserInfoService userInfoService;
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		logger.info("마이페이지 요청");
		
		return "main/mypage/mypage_main";
	}
	
	@RequestMapping("sideMypage.do")
	public String side(HttpSession session,Model model) {
		int userNo=(Integer)session.getAttribute("userNo");	
		ExpertVO vo=expertService.selectByUserNo(userNo);
		String eval="";
		if(vo!=null) {
			eval = evaluationService.evalAvgByExpertNo(vo.getExpertNo());
		}
		UserInfoVO userinfoVo = userInfoService.selectByuserNo(userNo);
		int authorNo = userinfoVo.getAuthorNo();
		model.addAttribute("expert",vo);
		model.addAttribute("eval", eval);
		model.addAttribute("authorNo", authorNo);
		return "main/incs/side_mypage";
	}
	
	@RequestMapping("/mypage_expert.do")
	public String mypage_expert() {
		logger.info("전문가 마이페이지 요청");
		
		return "main/mypage/mypage_expert_main";
	}
	
}
