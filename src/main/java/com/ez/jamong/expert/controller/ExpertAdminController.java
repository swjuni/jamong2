package com.ez.jamong.expert.controller;

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

import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.SearchVO;
import com.ez.jamong.common.WebUtility;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.report.model.ReportListVO;
import com.ez.jamong.report.model.ReportService;
import com.ez.jamong.report.model.ReportVO;

@Controller
@RequestMapping("admin/expert")
public class ExpertAdminController {
	private Logger logger=LoggerFactory.getLogger(ExpertAdminController.class);
	@Autowired private ReportService reportService;
	@Autowired private ExpertService expertService;
	
	@RequestMapping("/expertList.do")
	public String expert_list(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("전문가화면 관리 첫 페이지");
		logger.info("글목록 파라미터 searchVo={}", searchVo);
		
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
		List<Map<String, Object>> list=expertService.selectExpertSearch(searchVo);
		logger.info("글목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=expertService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/admin/expert/expertList";
	}
	
	@RequestMapping("/reportedExpert.do")
	public String reportedExpert(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("전문가 신고화면 첫 페이지");
		logger.info("글목록 파라미터 searchVo={}", searchVo);
		
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
		List<Map<String, Object>> list=reportService.selectReported(searchVo);
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
		
		return "admin/expert/reportedExpert";
	}
	
	@RequestMapping("/acceptMulti.do")
	public String acceptMulti(@ModelAttribute ReportListVO reportCol,
			@RequestParam String searchUseYn,@RequestParam String searchKeyword,
			@RequestParam String searchCondition, @RequestParam(defaultValue = "1") int currentPage,
			HttpSession session,Model model) {
		logger.info("신고승인, reportCol={}, searchUseYn={}",reportCol,searchUseYn);
		int adminNo=(Integer)session.getAttribute("adminNo");
		List<ReportVO> list=reportCol.getReportCol();
		
		//db
		int cnt = reportService.acceptReport(list,adminNo);
		logger.info("신고 승인 결과, cnt={}", cnt);
		
		String msg="", url="/admin/expert/reportedExpert.do?searchUseYn="+searchUseYn+"&searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&currentPage="+currentPage;
		if(cnt>0) {
			for(int i=0;i<list.size();i++) {
				ReportVO vo =list.get(i);
				logger.info("reportNo={}",vo.getReportNo());
			}
			
			msg="신고 승인처리 완료";
			
		}else {
			msg="신고 승인처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/refuseMulti.do")
	public String refuseMulti(@ModelAttribute ReportListVO reportCol,
			@RequestParam String searchUseYn,@RequestParam String searchKeyword,
			@RequestParam String searchCondition, @RequestParam(defaultValue = "1") int currentPage,
			HttpSession session,Model model) {
		logger.info("신고거부, reportCol={}",reportCol);
		int adminNo=(Integer)session.getAttribute("adminNo");
		List<ReportVO> list=reportCol.getReportCol();
		
		//db
		int cnt = reportService.refuseReport(list,adminNo);
		logger.info("신고 거부 결과, cnt={}", cnt);
		
		String msg="", url="/admin/expert/reportedExpert.do?searchUseYn="+searchUseYn+"&searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&currentPage="+currentPage;
		if(cnt>0) {
			for(int i=0;i<list.size();i++) {
				ReportVO vo =list.get(i);
				logger.info("reportNo={}",vo.getReportNo());
			}
			
			msg="신고 거부처리 완료";
			
		}else {
			msg="신고 거부처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/approveOne.do", method = RequestMethod.GET)
	public String acceptOne(@RequestParam(defaultValue = "0") int reportNo, @RequestParam(defaultValue = "0") int productNo,
			@RequestParam String searchUseYn,@RequestParam String searchKeyword,
			@RequestParam String searchCondition, @RequestParam(defaultValue = "1") int currentPage,
			HttpSession session, Model model) {
		int adminNo=(Integer)session.getAttribute("adminNo");
		logger.info("신고승인하나, reportNo={}, productNo={}",reportNo, productNo);
		
		//db
		int cnt = reportService.approveOne(reportNo, productNo,adminNo);
		logger.info("신고 한개 승인 결과, cnt={}", cnt);
		
		String msg="", url="/admin/expert/reportedExpert.do?searchUseYn="+searchUseYn+"&searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&currentPage="+currentPage;
		if(cnt>0) {
			
			msg="신고 승인처리 완료";
			
		}else {
			msg="신고 승인처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/refuseOne.do", method = RequestMethod.GET)
	public String refuseOne(@RequestParam(defaultValue = "0") int reportNo,
			@RequestParam String searchUseYn,@RequestParam String searchKeyword,
			HttpSession session, @RequestParam String searchCondition, @RequestParam(defaultValue = "1") int currentPage, Model model) {
		int adminNo=(Integer)session.getAttribute("adminNo");
		logger.info("신고거부하나, reportNo={},currentPage={}",reportNo,currentPage);
		
		int cnt=reportService.refuseOne(reportNo, adminNo);
		logger.info("신고 한개 거부 결과, cnt={}", cnt);
		
		String msg="", url="/admin/expert/reportedExpert.do?searchUseYn="+searchUseYn+"&searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&currentPage="+currentPage;
		if(cnt>0) {
			
			msg="신고 거부처리 완료";
			
		}else {
			msg="신고 거부처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
