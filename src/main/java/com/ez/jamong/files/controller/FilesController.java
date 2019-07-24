package com.ez.jamong.files.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.files.model.FilesService;

@Controller
public class FilesController {
	private Logger logger = LoggerFactory.getLogger(FilesController.class);
	@Autowired private FilesService filesService;	
	
	@RequestMapping("/main/mypage/files.do")
	public String menuinfoList_get(Model model) {
		logger.info("자료실 화면");
		
		return "main/mypage/files";
	}
	
	
}
