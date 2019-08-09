package com.ez.jamong.evaluation.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.evaluation.model.EvaluationService;
import com.ez.jamong.evaluation.model.EvaluationVO;

@Controller
@RequestMapping("/main")
public class EvaluationServiceController {
	private Logger logger = LoggerFactory.getLogger(EvaluationServiceController.class);
	@Autowired private EvaluationService evaluationService;
	
	@RequestMapping("/menuinfo/evaluationAdd.do")
	public String evaluationAdd(@ModelAttribute EvaluationVO evaluationVo, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("서비스 평가 등록, 파라미터 evaluationVo={}", evaluationVo);
		int userNo = (Integer)session.getAttribute("userNo");
		evaluationVo.setUserNo(userNo);
		
		int cnt = evaluationService.evaluationAdd(evaluationVo);
		if(cnt>0) {
			logger.info("서비스 평가 등록결과 성공 cnt={}",cnt);
		}else {
			logger.info("서비스 평가 등록결과 실패 cnt={}",cnt);
		}
		
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("/evalUpdate.do")
	public String update_evaluation(Model model) {
		logger.info("실시간 평가프레임");
		List<Map<String, Object>> list=evaluationService.selectToday();
		logger.info("평가 갯수 list={}",list);
		model.addAttribute("evalList",list);
		return "main/incs/evalFrame";
	}
	
	@RequestMapping("/selectRecentOne.do")
	@ResponseBody
	public Map<String , Object> select_recent(Model model,@RequestParam int no) {
		Map<String, Object> map=evaluationService.selectRecentOne(no);
		return map;
	}
}
