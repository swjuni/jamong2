package com.ez.jamong.guide.controller;

import java.util.List;

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

import com.ez.jamong.guide.model.GuideService;
import com.ez.jamong.guide.model.GuideVO;

@Controller
@RequestMapping("/admin/guide")
public class GuideController {
	private Logger logger = LoggerFactory.getLogger(GuideController.class);
	@Autowired private GuideService guideService;
	
	@RequestMapping("/guideList.do")
	public String guide_get(Model model) {
		logger.info("관리자 안내 페이지 화면 요청");
		
		List<GuideVO> list = guideService.selectAll();
		logger.info("안내 페이지 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/guide/guideList";		
	}
	
	@RequestMapping(value = "/guideAdd.do", method = RequestMethod.GET)
	public String guideAdd_get() {
		logger.info("관리자 안내 페이지 등록 화면 요청");
		return "admin/guide/guideAdd";
	}
	
	@RequestMapping(value = "/guideAdd.do", method = RequestMethod.POST)
	public String guideAdd_post(@ModelAttribute GuideVO guideVo, HttpServletRequest request, Model model) {
		logger.info("관리자 안내 페이지 등록 요청, 파라미터 guideVo={}", guideVo);
		
		guideVo.setAdminNo(1);	//나중에 admin session 값에 연결된 adminNo 등록해야함
		
		int cnt = guideService.guideAdd(guideVo);
		logger.info("안내 페이지 등록 결과, cnt={}", cnt);
		 
		String msg="", url="";
		if(cnt>0) {
			msg="글쓰기 처리되었습니다.";
			url="/admin/guide/guideList.do";
		}else {
			msg="글쓰기 실패";
			url="/admin/guide/guideAdd.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
	}
	
	@RequestMapping(value = "/guideDetail.do")
	public String guideDetail_get(@RequestParam(defaultValue = "0") int guideNo, HttpServletRequest request, Model model) {
		logger.info("관리자 안내 페이지 상세보기 요청, 파라미터 guideNo={}", guideNo);
		
		if(guideNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/guide/guideList.do");
			
			return "common/message";
		}
		
		GuideVO guideVo=guideService.selectByNo(guideNo);
		logger.info("상세보기 결과 vo={}", guideVo);
		
		model.addAttribute("vo", guideVo);
		
		return "admin/guide/guideDetail";
	}
	
	
	@RequestMapping(value = "/guideEdit.do", method = RequestMethod.GET)
	public String guideEdit_get(@RequestParam(defaultValue = "0")int guideNo, HttpServletRequest request, Model model) {
		logger.info("관리자 안내 페이지 수정 화면 요청, 파라미터 guideNo={}", guideNo);
		
		if(guideNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/guide/guideList.do");
			
			return "common/message";
		}
		
		GuideVO guideVo=guideService.selectByNo(guideNo);
		logger.info("상세보기 결과 vo={}", guideVo);
		
		model.addAttribute("vo", guideVo);
		
		return "admin/guide/guideEdit";
	}
	
	@RequestMapping(value = "/guideEdit.do", method = RequestMethod.POST)
	public String guideEdit_post(@ModelAttribute GuideVO guideVo, HttpServletRequest request, Model model) {
		logger.info("글수정 처리, 파라미터 guide={}", guideVo);
		
		int cnt = guideService.updateGuide(guideVo);
		logger.info("업데이트 결과 cnt={}, 파라미터 vo={}",cnt, guideVo);
		
		String msg="", url="/admin/guide/guideEdit.do?guideNo="+guideVo.getGuideNo();
		if(cnt>0) {
			msg="글 수정되었습니다.";
			url="/admin/guide/guideDetail.do?guideNo="+guideVo.getGuideNo();
		}else {
			msg="글 수정 실패.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping(value="/guideDelete.do", method=RequestMethod.GET)
	public String guideDelete_get(@ModelAttribute GuideVO guideVo, HttpServletRequest request, Model model) {
		logger.info("글 삭제 처리, 파라미터 guideVo={}", guideVo);
		
		String msg="", url="/admin/guide/guideDetail.do?guideNo="+guideVo.getGuideNo();
		
		int cnt = guideService.deleteGuide(guideVo.getGuideNo());
		logger.info("글 삭제처리 결과 cnt={}", cnt);
		if(cnt>0) {
			msg="글 삭제되었습니다.";
			url="/admin/guide/guideList.do";
		}else {
			msg="글 삭제 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}	
}
