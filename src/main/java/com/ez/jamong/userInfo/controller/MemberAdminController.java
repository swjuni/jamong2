package com.ez.jamong.userInfo.controller;

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

import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.SearchVO;
import com.ez.jamong.common.WebUtility;
import com.ez.jamong.userInfo.model.UserInfoService;

@Controller
@RequestMapping("/admin/member")
public class MemberAdminController {
	private Logger logger=LoggerFactory.getLogger(MemberAdminController.class);
	@Autowired private UserInfoService userInfoService;
	
	@RequestMapping("/memberList.do")
	public String member_list(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("개인화면 관리 첫 페이지");
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
		List<Map<String, Object>> list=userInfoService.selectUserInfoSearch(searchVo);
		logger.info("글목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=userInfoService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/admin/member/memberList";
	}
	
	@RequestMapping("/inactive.do")
	public String inactive(@RequestParam(defaultValue = "0") int userNo, @RequestParam(required = false) String searchKeyword,
			 @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchUseYn,
		@RequestParam(defaultValue = "1") int currentPage) {
		logger.info("회원 비활성화처리 파라미터 userNo={}",userNo);
		userInfoService.memberInactiveByUserNo(userNo);
		return "redirect:/admin/member/memberList.do?searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&searchUseYn="+searchUseYn+"&currentPage="+currentPage;
	}
	
	@RequestMapping(value = "/active.do",method = RequestMethod.GET)
	public String active(@RequestParam(defaultValue = "0") int userNo, @RequestParam(required = false) String searchKeyword,
			 @RequestParam(required = false) String searchCondition, @RequestParam(required = false) String searchUseYn,
		@RequestParam(defaultValue = "1") int currentPage) {
		logger.info("회원 활성화처리 파라미터 userNo={}, searchKeyword={}",userNo,searchKeyword);
		if(searchCondition==null ||searchCondition.isEmpty()) {
			searchCondition="";
		}
		if(searchKeyword==null ||searchKeyword.isEmpty()) {
			searchKeyword="";
		}
		userInfoService.memberActiveByUserNo(userNo);
		return "redirect:/admin/member/memberList.do?searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&searchUseYn="+searchUseYn+"&currentPage="+currentPage;
	}
	
	@RequestMapping("/inactiveMulti.do")
	public String inactiveMulti(@RequestParam(required = false) String[] chk,
			@RequestParam String searchUseYn,@RequestParam String searchKeyword,
			@RequestParam String searchCondition, @RequestParam(defaultValue = "1") int currentPage,
			HttpServletRequest request, Model model) {
		logger.info("일괄 중지 처리");
		
		int cnt=userInfoService.memberInActiveMulti(chk);
		
		String msg="", url="/admin/member/memberList.do?searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&searchUseYn="+searchUseYn+"&currentPage="+currentPage;
		if(cnt>0) {
			msg="사용 정지처리 완료";
		}else {
			msg="사용 정지처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/activeMulti.do")
	public String activeMulti(@RequestParam(required = false) String[] chk,
			@RequestParam String searchUseYn,@RequestParam String searchKeyword,
			@RequestParam String searchCondition, @RequestParam(defaultValue = "1") int currentPage,
			HttpServletRequest request, Model model) {
		logger.info("일괄 사용 재개 처리");
		
		int cnt=userInfoService.memberActiveMulti(chk);
		
		String msg="", url="/admin/member/memberList.do?searchKeyword="+searchKeyword+"&searchCondition="+searchCondition+"&searchUseYn="+searchUseYn+"&currentPage="+currentPage;
		if(cnt>0) {
			msg="사용 재개처리 완료";
		}else {
			msg="사용 재개처리 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
