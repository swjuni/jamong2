package com.ez.jamong.menuInfo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;

@Controller
public class MenuInfoController {
	private Logger logger = LoggerFactory.getLogger(MenuInfoController.class);
	@Autowired private MenuInfoService menuinfoService;	
	
	@RequestMapping("/admin/menuinfo/menuinfoList.do")
	public String menuinfoList_get(Model model) {
		logger.info("상품 목록 화면 요청");
		
		List<Map<String, Object>> map = menuinfoService.selectMenuinfoAllView();
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("map", map);
		
		return "admin/menuinfo/menuinfoList";
	}
	
	@RequestMapping(value = "/admin/menuinfo/menuinfoDetail.do")
	public String menuinfoDetail_get(@RequestParam(defaultValue = "0") int productNo, @RequestParam(required = false) String activation, HttpServletRequest request, Model model) {
		logger.info("상품 상세보기 화면 요청, 파라미터 productNo={}, activation={}", productNo, activation);
		
		if(productNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menuinfo/menuinfoList.do");
			return "common/message";
		}

		
		MenuInfoVO menuinfoVo = menuinfoService.selectMenuInfoByNo(productNo);
		logger.info("상세보기 결과 vo={}", menuinfoVo);
		
		if(activation != null && !activation.isEmpty()) {
		
			if(!activation.equals("Y") && !activation.equals("N")){
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/admin/menuinfo/menuinfoList.do");
				return "common/message";
			}else if(activation.equals("Y")) {
				activation = "N";
			}else if(activation.equals("N")) {
				activation = "Y";
			}	
		
			menuinfoVo.setActivation(activation);
			logger.info("활성화/비활성화 버튼 클릭 , 파라미터 productNo={}, activation={}", productNo, activation);
		}
		
		menuinfoService.updateActivation(menuinfoVo);

		Map<String, Object> map = menuinfoService.selectMenuinfoView(productNo);
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("vo", menuinfoVo);
		model.addAttribute("map", map);
		
		return "admin/menuinfo/menuinfoDetail";
	}
	
	@RequestMapping(value = "/admin/menuinfo/menuinfoDelete.do", method = RequestMethod.GET)
	public String menuinfoDelete_get(@RequestParam(defaultValue = "0") int productNo, HttpServletRequest request, Model model) {
		logger.info("상품 삭제 화면 요청");
		
		if(productNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/menuinfo/menuinfoList.do");
			
			return "common/message";
		}
		MenuInfoVO menuinfoVo = menuinfoService.selectMenuInfoByNo(productNo);
		logger.info("상품 상세보기 결과 vo={}", menuinfoVo);
		
		model.addAttribute("vo", menuinfoVo);
		
		return "admin/menuinfo/menuinfoDelete";
	}
	
	@RequestMapping(value = "/admin/menuinfo/menuinfoDelete.do", method = RequestMethod.POST)
	public String menuinfoDelete_post(@ModelAttribute MenuInfoVO menuinfoVo, HttpServletRequest request, Model model) {
		logger.info("상품 삭제 요청, 파라미터 menuinfoVo={}", menuinfoVo);
		
		String msg="", url="/admin/menuinfo/menuinfoDelete.do?productNo=" + menuinfoVo.getProductNo();
		
		int cnt = menuinfoService.deleteMenuInfo(menuinfoVo.getProductNo());
		logger.info("상품 삭제 처리 결과 cnt={} ",cnt);
		
		if(cnt>0) {
			msg="상품이 삭제되었습니다.";
			url="/admin/menuinfo/menuinfoList.do";
			}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
	
		return "common/message";
	}
	
	
	
}
