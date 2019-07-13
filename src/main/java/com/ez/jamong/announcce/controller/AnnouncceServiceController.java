package com.ez.jamong.announcce.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.announcce.model.AnnouncceService;
import com.ez.jamong.announcce.model.AnnouncceVO;
import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.SearchVO;

@Controller
@RequestMapping("/main/announcce")
public class AnnouncceServiceController {
	private Logger logger = LoggerFactory.getLogger(AnnouncceController.class);
	@Autowired private AnnouncceService announcceService;
	//@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/announcceServiceList.do")
	public String announcceServiceList_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("서비스 공지사항 화면 요청");

		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setRecordCountPerPage(4);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(4);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		//[3] 조회처리
		List<AnnouncceVO> list=announcceService.selectSearch(searchVo);
		logger.info("글목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=announcceService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		for(int i=0; i<list.size();i++) {
			AnnouncceVO vo = list.get(i);
			String html = vo.getContent();
			html = html.replaceAll("<\\/.*?>", "\r\n");
			logger.info("1차변환 {}",html);
			//html = html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
			html = html.replaceAll("<.*?>","");
			logger.info("2차변환 {}",html);
			html = html.replaceAll("\r\n", "<br>");
			logger.info("3차변환 {}",html);
			for(int j=0;j<5;j++) {
				html=html.replaceAll("<br><br>", "<br>");
			}
			vo.setContent(html);
			logger.info("4차변환 {}",vo.getContent());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/announcce/announcce";
	}
}
