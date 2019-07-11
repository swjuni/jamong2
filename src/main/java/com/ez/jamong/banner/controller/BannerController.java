package com.ez.jamong.banner.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.bannerEx.model.BannerExService;
import com.ez.jamong.bannerEx.model.BannerExVO;

@Controller
public class BannerController {
	private Logger logger = LoggerFactory.getLogger(BannerController.class);
	@Autowired private BannerExService bannerExService;
	
	@RequestMapping("/admin/bannerexpoert/bannerList.do")
	public String bannereList_get(Model model) {
		logger.info("배너 목록 보기");
		
		List<Map<String, Object>> map = bannerExService.selectAdsAllView();
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("map", map);
		
		return "admin/bannerexpoert/bannerList";
	}
	
	@RequestMapping(value = "/admin/bannerexpoert/bannerDetail.do", method = RequestMethod.GET)
	public String bannereDetail_get(@RequestParam(defaultValue = "0") int adsNo, @RequestParam(required = false) String activation,  @RequestParam(required = false) String approveDelflag, HttpServletRequest request, Model model) {
		logger.info("상품 상세보기 화면 요청, 파라미터 no={}, activation={}", adsNo, activation);
		logger.info("approveDelflag={}",approveDelflag);

		if(adsNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/bannerexpoert/bannerList.do");
			return "common/message";
		}

		
		BannerExVO bannerExVo = bannerExService.selectAdsByNo(adsNo);
		logger.info("상세보기 결과 vo={}", bannerExVo);
		
		if(activation != null && !activation.isEmpty()) {
			if(!activation.equals("Y") && !activation.equals("N")){
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/admin/bannerexpoert/bannerList.do");
				return "common/message";
			}else if(activation.equals("Y")) {
				activation = "N";
			}else if(activation.equals("N")) {
				activation = "Y";
			}	
		
			bannerExVo.setActivation(activation);
			logger.info("활성화/비활성화 버튼 클릭 , 파라미터 adsNo={}, activation={}", adsNo, activation);
		}
		
		if(approveDelflag != null && !approveDelflag.isEmpty()) {
			
			if(!approveDelflag.equals("Y") && !approveDelflag.equals("C") && !approveDelflag.equals("N")){
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/admin/bannerexpoert/bannerList.do");
				return "common/message";
			}else if(approveDelflag.equals("Y")) {
				approveDelflag = "C";
				if(activation.equals("Y")) {
					activation = "N";
				}
				bannerExVo.setActivation(activation);
				
				bannerExService.endDate(bannerExVo);
			}else if(approveDelflag.equals("C")) {
				approveDelflag = "Y";
				bannerExService.updateDate(bannerExVo);
			}else if(approveDelflag.equals("N")) {
				approveDelflag = "Y";
				bannerExService.updateDate(bannerExVo);
			}
		
			bannerExVo.setApproveDelflag(approveDelflag);
			logger.info("활성화/비활성화 버튼 클릭 , 파라미터 adsNo={}, activation={}", adsNo, approveDelflag);
		}

		bannerExService.updateActivation(bannerExVo);
		bannerExService.updateApprove(bannerExVo);
		
		Map<String, Object> map = bannerExService.selectAdsView(adsNo);
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("vo", bannerExVo);
		model.addAttribute("map", map);
		
		return "admin/bannerexpoert/bannerDetail";
	}
	
	@RequestMapping(value = "/admin/bannerexpoert/bannerDetail.do", method = RequestMethod.POST)
	public String bannereDetail_post() {
		logger.info("배너 상세보기 요청");
		return "admin/bannerexpoert/bannerDetail";
	}
	
	@RequestMapping(value = "/admin/bannerexpoert/bannerDelete.do", method = RequestMethod.GET)
	public String bannereDelete_get() {
		logger.info("배너 삭제 화면 요청");
		return "admin/bannerexpoert/bannerDelete";
	}
	
	@RequestMapping(value = "/admin/bannerexpoert/bannerDelete.do", method = RequestMethod.POST)
	public String bannereDelete_post() {
		logger.info("배너 삭제 요청");
		return "admin/bannerexpoert/bannerDelete";
	}
	
	
	
	
	/*
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	@RequestMapping("/admin/bannermanager/bannerList.do")
	public String bannermList_get() {
		logger.info("관리자 배너 목록 보기");
		return "admin/bannermanager/bannerList";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerAdd.do", method = RequestMethod.GET)
	public String bannermAdd_get() {
		logger.info("관리자 배너 등록 화면 요청");
		return "admin/bannermanager/bannerAdd";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerAdd.do", method = RequestMethod.POST)
	public String bannermAdd_post() {
		logger.info("관리자 배너 등록 요청");
		return "admin/bannermanager/bannerAdd";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDetail.do", method = RequestMethod.GET)
	public String bannermDetail_get() {
		logger.info("관리자 배너 상세보기 화면 요청");
		return "admin/bannermanager/bannerDetail";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDetail.do", method = RequestMethod.POST)
	public String bannermDetail_post() {
		logger.info("관리자 배너 상세보기 요청");
		return "admin/bannermanager/bannerDetail";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerEdit.do", method = RequestMethod.GET)
	public String  bannermEdit_get() {
		logger.info("관리자 배너 수정 화면 요청");
		return "admin/bannermanager/bannerEdit";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerEdit.do", method = RequestMethod.POST)
	public String bannermEdit_post() {
		logger.info("관리자 배너 수정 요청");
		return "admin/bannermanager/bannerEdit";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDelete.do", method = RequestMethod.GET)
	public String bannermDelete_get() {
		logger.info("관리자 배너 삭제 화면 요청");
		return "admin/bannermanager/bannerDelete";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDelete.do", method = RequestMethod.POST)
	public String bannermDelete_post() {
		logger.info("관리자 배너 삭제 요청");
		return "admin/bannermanager/bannerDelete";
	}
	*/
	
	
	
}
