package com.ez.jamong.Author.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.Author.model.AuthorService;
import com.ez.jamong.Author.model.AuthorVO;
import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;

@Controller
@RequestMapping("/admin")
public class AuthorController {
	private Logger logger = LoggerFactory.getLogger(AuthorController.class);
	
	@Autowired
	private AuthorService authorService;
	
	@RequestMapping("/manage/admin_grade_update.do")
	@ResponseBody
	public int gradeAdminUpdate(@ModelAttribute AuthorVO vo) {
		logger.info("등급 수정 vo={}",vo);
		
		int cnt = authorService.updateAutorityAdmin(vo);
		logger.info("등급 수정 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/manage/grade_insert.do")
	@ResponseBody
	public int gradeInsert(@ModelAttribute AuthorVO vo) {
		logger.info("등급 등록 vo={}",vo);
		
		int cnt = authorService.gradeInsert(vo);
		logger.info("등급 등록 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/manage/grade_delete.do")
	@ResponseBody
	public int gradeDelete(@RequestParam String name) {
		logger.info("등급 삭제 name={}",name);
		
		int cnt = authorService.gradeDelete(name);
		logger.info("등급 삭제 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/manage/grade_select.do")
	@ResponseBody
	public List<Integer> gradeSelect() {
		logger.info("등급 List");
		
		List<Integer> list = authorService.selectAuthorityList();
		logger.info("등급 List={}",list);
		
		return list;
	}
	
	
}