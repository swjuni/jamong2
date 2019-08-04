package com.ez.jamong.pay.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.common.DateSearchVO;
import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.WebUtility;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.image.ImageService;
import com.ez.jamong.image.ImageVO;
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;
import com.ez.jamong.packages.model.PackageService;
import com.ez.jamong.packages.model.PackageVO;
import com.ez.jamong.pay.model.PayService;
import com.ez.jamong.userInfo.model.UserInfoService;

@Controller
public class PayController {
	private Logger logger = LoggerFactory.getLogger(PayController.class);
	@Autowired private PayService payService;
	@Autowired private MenuInfoService menuInfoService;
	@Autowired private ImageService imageService;
	@Autowired private ExpertService expertService;
	@Autowired private PackageService packageService;
	@Autowired private UserInfoService userInfoService;
	
	@RequestMapping("/mypage/payList/payList.do")
	public String payList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		dateSearchVo.setUserNo(userNo);
		
		logger.info("결제내역 조회 파라미터 vo={}", dateSearchVo);

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
		
		List<Map<String, Object>> list = payService.selectByUserNo(dateSearchVo);
		logger.info("결제내역 조회 결과, list.size={}", list.size());

		int totalRecord = payService.selectTotalRecord(dateSearchVo);
		logger.info("결제내역-전체 레코드 조회, 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/mypage/payList";
	}
	
	@RequestMapping("/main/payCheck.do")
	public String payCheckVeiw(Model model, HttpSession session) {
		//packageNo받아와야함
		int packNo=25;
		int userNo=(Integer)session.getAttribute("userNo");
		PackageVO packVo=packageService.selectByPackageNO(packNo);
		int productNo=packVo.getProductNo();
		ImageVO img=imageService.selectByProductNoFirstImage(productNo);
		Map<String, Object> map=menuInfoService.selectMenuinfoView(productNo);
		int expertNo=(Integer)map.get("EXPERT_NO");
		ExpertVO expertVo=expertService.selectByExpertNo(expertNo);
		Map<String, Object> userMap=userInfoService.selectViewByUserNo(userNo);
		model.addAttribute("img",img);
		model.addAttribute("map",map);
		model.addAttribute("expertVo",expertVo);
		model.addAttribute("packVo",packVo);
		model.addAttribute("userMap",userMap);
		return"main/payment/payCheck";
	}
}
