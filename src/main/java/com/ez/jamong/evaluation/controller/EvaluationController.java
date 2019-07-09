package com.ez.jamong.evaluation.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
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
		
		Map<String, Object> map=evaluationService.selectByNo(evalNo);
		logger.info("상세보기 결과 map={}", map);
		StringBuffer strOut = null;
		if(map.get("REVIEW") instanceof java.sql.Clob) {
			strOut = new StringBuffer();
			String str="";
			Clob clob = (java.sql.Clob)map.get("REVIEW");
			BufferedReader br;
			try {
				br = new BufferedReader(clob.getCharacterStream());
				while((str=br.readLine())!=null) {
					strOut.append(str+"<br>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("map", map);
		model.addAttribute("review", strOut);
		
		return "admin/evaluation/evaluationDetail";
	}
	
	@RequestMapping(value="/evaluationDelete.do")
	public String evaluationDelete_get(@RequestParam(defaultValue = "0") int evalNo, Model model) {
		logger.info("관리자 FAQ 삭제 요청, 파라미터 evalNo={}",evalNo);
		
		if(evalNo==0) {
			model.addAttribute("msg", "잘못된 URL 접근입니다");
			model.addAttribute("url", "/admin/evaluation/evaluationList.do");
			return "common/message";
		}
		
		int cnt = evaluationService.deleteEvaluation(evalNo);
		
		String msg="", url="/admin/evaluation/evaluationDetail.do?evalNo="+evalNo;
		if(cnt>0) {
			msg="서비스 평가 삭제 성공";
			url="/admin/evaluation/evaluationList.do";
		}else {
			msg="서비스 평가 삭제 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
