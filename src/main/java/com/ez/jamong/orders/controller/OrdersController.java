package com.ez.jamong.orders.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.common.DateSearchVO;
import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.WebUtility;

@Controller
public class OrdersController {
	private Logger logger = LoggerFactory.getLogger(OrdersController.class);
	
	@RequestMapping("/mypage/orders/buyList.do")
	public String buyList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		dateSearchVo.setUserNo(userNo);
		
		logger.info("구매관리화면 조회 파라미터 vo={}", dateSearchVo);

		//시작일이 null인 경우 현재일자 세팅
		String startDay = dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);
			logger.info("현재 일자 setting후 vo={}",dateSearchVo);
		}
		
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		
		//
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		
		//List<Map<String, Object>> list = payService.selectByUserNo(dateSearchVo);
		//logger.info("결제내역 조회 결과, list.size={}", list.size());

		//int totalRecord = payService.selectTotalRecord(dateSearchVo);
		//logger.info("결제내역-전체 레코드 조회, 결과 totalRecord={}", totalRecord);
		//pagingInfo.setTotalRecord(totalRecord);
		
		//model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/mypage/buyList";
	}
	
	
	@RequestMapping("/mypage/orders/sellList.do")
	public String sellList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		dateSearchVo.setUserNo(userNo);
		
		logger.info("판매관리화면 조회 파라미터 vo={}", dateSearchVo);
		
		//시작일이 null인 경우 현재일자 세팅
		String startDay = dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);
			logger.info("현재 일자 setting후 vo={}",dateSearchVo);
		}
		
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		
		//
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		
		//List<Map<String, Object>> list = payService.selectByUserNo(dateSearchVo);
		//logger.info("결제내역 조회 결과, list.size={}", list.size());
		
		//int totalRecord = payService.selectTotalRecord(dateSearchVo);
		//logger.info("결제내역-전체 레코드 조회, 결과 totalRecord={}", totalRecord);
		//pagingInfo.setTotalRecord(totalRecord);
		
		//model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/mypage/sellList";
	}
}
