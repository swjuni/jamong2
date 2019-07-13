package com.ez.jamong.announcce.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.announcce.model.AnnouncceService;
import com.ez.jamong.announcce.model.AnnouncceVO;

@Controller
@RequestMapping("/main/announcce")
public class AnnouncceServiceController {
	private Logger logger = LoggerFactory.getLogger(AnnouncceController.class);
	@Autowired private AnnouncceService announcceService;
	//@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/announcceServiceList.do")
	public String announcceServiceList_get(Model model) {
		logger.info("서비스 공지사항 화면 요청");
		
		List<AnnouncceVO> list = announcceService.selectAll();
		logger.info("공지사항 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "main/announcce/announcce";
	}
}
