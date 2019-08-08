package com.ez.jamong.files.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.ez.jamong.files.model.FilesService;
import com.ez.jamong.files.model.FilesVO;

@Controller
public class FilesController {
	private Logger logger = LoggerFactory.getLogger(FilesController.class);
	@Autowired private FilesService filesService;	
	
	@RequestMapping("/main/mypage/files.do")
	public String menuinfoList_get(Model model) {
		logger.info("자료실 화면");
		
		return "main/mypage/files";
	}
	
	@RequestMapping("/main/mypage/filesExUser.do")
	public String filesUser(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userno=(Integer)session.getAttribute("userNo");
		logger.info("ddddddddddddddddd={}",userno);
		List<Map<String, Object>> list1=filesService.selectfileUser(userno);
		List<Map<String, Object>> list2=filesService.selectfileExpert(userno);
		
		logger.info("구매자(일반회원)입장 보낸자료 자료실 list.size={}",list1.size());
		logger.info("판매자(전문가)입장 보낸자료 자료실 list.size={}",list2.size());
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "main/mypage/files";
	}
	
	/*
	@RequestMapping("/main/mypage/filesUser.do")
	@ResponseBody
	public List<FilesVO> filesUser(@RequestParam int userno,Model model) {
		logger.info("ddddddddddddddddd={}",userno);
		List<FilesVO> list = null;
		list=filesService.selectfileUser(userno);
		logger.info("구매자(일반회원)입장 보낸자료 자료실 list.size={}",list.size());
		model
		return list;
	}
	
	@RequestMapping("/main/mypage/filesExpert.do")
	@ResponseBody
	public List<FilesVO> filesExpert(@RequestParam int userno, Model model) {
		List<FilesVO> list = null;
		list=filesService.selectfileExpert(userno);
		logger.info("판매자(전문가)입장 보낸자료 자료실 list.size={}",list.size());
		return list;
	}
	*/
	
}
