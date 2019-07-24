package com.ez.jamong.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.userInfo.model.UserInfoService;
import com.ez.jamong.userInfo.model.UserInfoVO;

@Controller
@RequestMapping("/registExpert")
public class RegistExpertController {
	private Logger logger=LoggerFactory.getLogger(RegistExpertController.class);
	@Autowired private UserInfoService userInfoService;
	@Autowired private ExpertService expertService;
	@Autowired private CategoryLService categoryLService;
	
	@RequestMapping("/registExpert.do")
	public String registExpert(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("전문가로 전환 페이지 파라미터 userNo={}",userNo);
		UserInfoVO userInfo=userInfoService.selectByuserNo(userNo);
		ExpertVO expert=expertService.selectByUserNo(userNo);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("expert",expert);
		return "main/mypage/regist_expert";
	}
	
	@RequestMapping("/regist.do")
	public String regist(@ModelAttribute ExpertVO expertVo,Model model) {
		logger.info("전문가 인증들록 파라미터 expertVo={}",expertVo);
		int cnt=expertService.InsertExpert(expertVo);
		String msg="", url="/registExpert/registProfile.do?state=profile&userNo="+expertVo.getUserNo();//페이지 생성하고 바꾸기
		if(cnt>0) {
			msg="저장되었습니다.";
		}else {
			msg="저장에 실패하였습니다.";
			url="/registExpert/registExpert.do?userNo="+expertVo.getUserNo();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/registProfile.do")
	public String registProfile(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("전문가로 전환 프로필 등록 페이지 파라미터 userNo={}",userNo);
		ExpertVO expert=expertService.selectByUserNo(userNo);
		model.addAttribute("expert",expert);
		List<CategoryLVO> list=categoryLService.selectCategorylAll();
		model.addAttribute("list",list);
		return "main/mypage/regist_profile";
	}
}
