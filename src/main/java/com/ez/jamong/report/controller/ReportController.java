package com.ez.jamong.report.controller;

import java.util.List;

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

import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.SearchVO;
import com.ez.jamong.common.WebUtility;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;
import com.ez.jamong.report.model.ReportExtendsVO;
import com.ez.jamong.report.model.ReportService;
import com.ez.jamong.report.model.ReportVO;

@Controller
@RequestMapping("/mypage")
public class ReportController {
	private Logger logger=LoggerFactory.getLogger(ReportController.class);
	@Autowired private ReportService reportService;
	@Autowired private ExpertService expertService;
	@Autowired private MenuInfoService menuinfoService;
	
	@RequestMapping(value = "/reportAdd.do", method = RequestMethod.GET)
	public String report_add_get(@RequestParam(defaultValue = "0") int expertNo, @RequestParam(defaultValue = "0") int productNo, Model model) {
		logger.info("전문가 신고 등록화면 요청, 파라미터 expertNo={}",expertNo);
		
		if(expertNo==0 || productNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index_main.do");
			return "common/message";
		}
		
		ExpertVO expertVo = expertService.selectByExpertNo(expertNo);
		logger.info("expertVo상세보기 결과 vo={}", expertVo);
		
		MenuInfoVO menuinfoVo = menuinfoService.selectMenuInfoByNo(productNo);
		logger.info("menuinfoVo상세보기 결과 vo={}", menuinfoVo);
		
		model.addAttribute("expertVo", expertVo);
		model.addAttribute("menuinfoVo", menuinfoVo);
		return "main/report/report_add";
	}

	@RequestMapping(value = "/reportAdd.do", method = RequestMethod.POST)
	public String report_add_post(@ModelAttribute ReportVO reportVo ,HttpSession session ,Model model) {
		logger.info("전문가 신고 등록 요청, 파라미터 reportVo={}", reportVo);
		int userNo = (Integer)session.getAttribute("userNo");
		int productNo = reportVo.getProductNo();
		reportVo.setUserNo(userNo);
		
		int cnt = reportService.reportAdd(reportVo);
		logger.info("전문가 신고 결과 cnt={}",cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="신고 접수 완료";
			url="/mypage/mypage.do";
		}else {
			msg="신고 접수 실패";
			url="/main/menuinfo/menuinfo_Detail.do?productNo="+productNo;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//아래내용은 전부 바꿔야함
	@RequestMapping("/reportedExpert.do")
	public String reportedExpert(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		logger.info("마이페이지 전문가 신고 목록 화면");
		logger.info("글목록 파라미터 searchVo={}", searchVo);
		int userNo = (Integer) session.getAttribute("userNo");
		
		//2
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		//[3] 조회처리
		List<ReportExtendsVO> list = reportService.reportListByUserNo(userNo);
		logger.info("글목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=reportService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/report/report_list";
	}
}
