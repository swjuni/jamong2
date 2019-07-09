package com.ez.jamong.evaluation.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.evaluation.model.EvaluationService;
import com.ez.jamong.evaluation.model.EvaluationVO;

@Controller
@RequestMapping("/admin/evaluation")
public class EvaluationController {
	private Logger logger = LoggerFactory.getLogger(EvaluationController.class);
	@Autowired private EvaluationService evaluationService;

	@RequestMapping("/evaluationList.do")
	public String evaluationList(Model model) {
		logger.info("관리자 서비스 평가 화면 요청");
		
		List<Map<String, Object>> list = evaluationService.selectAll();
		logger.info("안내 페이지 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/evaluation/evaluationList";
	}
	
	@RequestMapping(value="/evaluationDetail.do", method = RequestMethod.GET)
	public String evaluationDetail_get(@RequestParam(defaultValue = "0") int evalNo, Model model) {
		logger.info("관리자 서비스 평가 상세보기 요청");
		
		if(evalNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/evaluation/evaluationList.do");
			
			return "common/message";
		}
		
		EvaluationVO evaluationVo=evaluationService.selectByNo(evalNo);
		logger.info("상세보기 결과 vo={}", evaluationVo);
		
		model.addAttribute("vo", evaluationVo);
		
		return "admin/evaluation/evaluationDetail";
	}
}
