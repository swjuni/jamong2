package com.ez.jamong.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.categorym.model.CategoryMVO;

@Controller
@RequestMapping("/main")
public class MainController {
	private Logger logger=LoggerFactory.getLogger(MainController.class);
	@Autowired CategoryLService categorylService;
	@Autowired CategoryMService categoryMService;

	@RequestMapping("/index_main.do")
	public String main_view() {
		logger.info("메인 페이지");
		
		return "main/index_main";
	}
	
	@RequestMapping("/showCategoryL.do")
	public String showCategoryL(Model model){
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		logger.info("카테고리(대) 목록 list.size={}",list.size());
		model.addAttribute("list",list);
		return "main/incs/showCategoryL";
	}
	
	@RequestMapping("/showCategoryM.do")
	@ResponseBody
	public List<CategoryMVO> showCategoryM(@RequestParam int no) {
		logger.info("카테고리 중 뿌려주기 파라미터 no={}",no);
		List<CategoryMVO> list=categoryMService.selectCategoryM(no);
		logger.info("카테고리 중 조회 list.size={}",list.size());
		return list;
	}
	
	@RequestMapping("/categoryList_bottom.do")
	public String bottomCategoryL(Model model){
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		logger.info("카테고리(대) 목록 list.size={}",list.size());
		model.addAttribute("btCatList", list);
		return "main/incs/categoryList_bottom";
	}
}
