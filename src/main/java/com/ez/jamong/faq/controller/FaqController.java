package com.ez.jamong.faq.controller;

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

import com.ez.jamong.faq.model.FaqCategoryVO;
import com.ez.jamong.faq.model.FaqListVO;
import com.ez.jamong.faq.model.FaqService;
import com.ez.jamong.faq.model.FaqVO;

@Controller
@RequestMapping("/admin/faq")
public class FaqController {
	private Logger logger = LoggerFactory.getLogger(FaqController.class);
	@Autowired private FaqService faqService;
	
	@RequestMapping("/faqList.do")
	public String faqList_get(@RequestParam(defaultValue = "0") int faqCateNo, Model model) {
		logger.info("관리자 FAQ 화면 요청, 파라미터 faqCateNo={}",faqCateNo);
		
		List<FaqCategoryVO> catList = faqService.selectCateAll();
		logger.info("카테고리목록 조회 결과 list.size={}", catList.size());
		
		model.addAttribute("catList", catList);

		List<FaqVO> list = faqService.selectAll(faqCateNo);
		logger.info("FAQ목록 요청 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/faq/faqList";
	}
	
	@RequestMapping(value = "/faqAdd.do", method = RequestMethod.GET)
	public String faqAdd_get(Model model) {
		logger.info("관리자 FAQ 등록 화면 요청");
		
		List<FaqCategoryVO> list = faqService.selectCateAll();
		logger.info("카테고리목록 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/faq/faqAdd";
	}
	
	@RequestMapping(value = "/faqAdd.do", method = RequestMethod.POST)
	public String faqAdd_post(@ModelAttribute FaqVO faqVo, Model model) {
		logger.info("관리자 FAQ 등록 요청");
		
		faqVo.setAdminNo(1); //나중에 admin session 값에 연결된 adminNo 등록해야함
		
		int cnt = faqService.faqAdd(faqVo);
		logger.info("FAQ등록 결과 cnt={}",cnt);

		String msg="", url="";
		if(cnt>0) {
			msg="글쓰기 처리되었습니다.";
			url="/admin/faq/faqList.do";
		}else {
			msg="글쓰기 실패";
			url="/admin/faq/faqAdd.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/faqDetail.do")
	public String faqDetail_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("관리자 FAQ 상세보기 요청");
		
		if(faqNo==0) {
			model.addAttribute("msg", "잘못된 URL 접근입니다");
			model.addAttribute("url", "/admin/faq/faqList.do");
			return "common/message";
		}
		
		FaqVO faqVo = faqService.selectByNo(faqNo);
		logger.info("관리자 FAQ 상세보기 결과 faqVo={}", faqVo);
		
		model.addAttribute("vo", faqVo);
		
		return "admin/faq/faqDetail";
	}
	
	@RequestMapping(value = "faqEdit.do", method = RequestMethod.GET)
	public String faqEdit_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("관리자 FAQ 수정화면 요청");
		
		if(faqNo==0) {
			model.addAttribute("msg", "잘못된 URL 접근입니다");
			model.addAttribute("url", "/admin/faq/faqList.do");
			return "common/message";
		}

		List<FaqCategoryVO> list = faqService.selectCateAll();
		logger.info("카테고리목록 조회 결과 list.size={}", list.size());
		
		FaqVO faqVo = faqService.selectByNo(faqNo);
		logger.info("관리자 FAQ 수정화면 요청 결과 faqVo={}", faqVo);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", faqVo);
		
		return "admin/faq/faqEdit";
		
	}
	
	@RequestMapping(value = "faqEdit.do", method = RequestMethod.POST)
	public String faqEdit_post(@ModelAttribute FaqVO faqVo,Model model) {
		logger.info("관리자 FAQ 수정 요청");
		
		int cnt = faqService.updateFaq(faqVo);
		logger.info("관리자 FAQ 수정 요청 결과 cnt={}", cnt);
		
		String msg="", url="/admin/faq/faqEdit.do?faqNo="+faqVo.getFaqNo();
		if(cnt>0) {
			msg="FAQ수정 성공";
			url="/admin/faq/faqDetail.do?faqNo="+faqVo.getFaqNo();
		}else {
			msg="FAQ수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping(value = "faqDelete.do", method = RequestMethod.GET)
	public String faqDelete_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("관리자 FAQ 삭제 요청");
		
		if(faqNo==0) {
			model.addAttribute("msg", "잘못된 URL 접근입니다");
			model.addAttribute("url", "/admin/faq/faqList.do");
			return "common/message";
		}
		
		int cnt = faqService.deleteFaq(faqNo);
		
		String msg="", url="/admin/faq/faqDetail.do?faqNo="+faqNo;
		if(cnt>0) {
			msg="FAQ삭제 성공";
			url="/admin/faq/faqList.do";
		}else {
			msg="FAQ삭제 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/deleteMulti.do")
	public String deleteMulti(@ModelAttribute FaqListVO faqItems, HttpServletRequest request, Model model) {
		logger.info("선택한 상품들 삭제, faqItems={}",faqItems);
		
		List<FaqVO> list = faqItems.getFaqItems();
		
		//db
		int cnt = faqService.deleteFaqItems(list);
		logger.info("여러개 상품 삭제 결과, cnt={}", cnt);
		
		//file delete
		String msg="", url="/admin/faq/faqList.do";
		if(cnt>0) {
			for(int i=0;i<list.size();i++) {
				FaqVO vo =list.get(i);
				logger.info("{} : AnnounceNo={}",i,vo.getFaqNo());
			}//for
			
			msg="선택한 FAQ가 삭제되었습니다.";
			
		}else {
			msg="선택한 FAQ 삭제 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}	
}
