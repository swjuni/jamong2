package com.ez.jamong.menuInfo.controller;

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
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;

@Controller
@RequestMapping("/registExpert")
public class RegistMenuInfoController {
	private Logger logger=LoggerFactory.getLogger(RegistMenuInfoController.class);
	@Autowired private CategoryLService categoryLService;
	@Autowired private MenuInfoService menuInfoService;

	@RequestMapping("service.do")
	public String service(Model model,@RequestParam(defaultValue = "0") int expertNo) {
		logger.info("서비스등록 첫화면 expertNo={}",expertNo);
		MenuInfoVO menuVo=menuInfoService.NonAvtivatedProduct(expertNo);
		List<CategoryLVO> list=categoryLService.selectCategorylAll();
		model.addAttribute("list",list);
		model.addAttribute("menuVo",menuVo);
		return "main/mypage/regist_service";
	}
	
	@RequestMapping("registService.do")
	public String registService(Model model,@ModelAttribute MenuInfoVO menuInfoVo) {
		logger.info("서비스 등록 파라미터 menuInfoVo={}",menuInfoVo);
		int cnt=menuInfoService.saveProduct(menuInfoVo);
		String msg="", url="";
		if(cnt>0) {
			msg="저장 되었습니다.";
			url="/registExpert/service.do?expertNo="+menuInfoVo.getExpertNo();
		}else {
			msg="저장 실패";
			url="/registExpert/service.do?expertNo="+menuInfoVo.getExpertNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
