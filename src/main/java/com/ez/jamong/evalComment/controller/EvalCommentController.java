package com.ez.jamong.evalComment.controller;

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

import com.ez.jamong.evalComment.model.EvalCommentService;
import com.ez.jamong.evalComment.model.EvalCommentVO;

@Controller
@RequestMapping("/main")
public class EvalCommentController {
	private Logger logger = LoggerFactory.getLogger(EvalCommentController.class);
	@Autowired private EvalCommentService evalCommentService;
	
	@RequestMapping("/menuinfo/evaluationReply.do")
	public String evaluationReply(@ModelAttribute EvalCommentVO evalCommentVo, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("서비스 평가 등록, 파라미터 evalCommentVo={}", evalCommentVo);
		int userNo = (Integer)session.getAttribute("userNo");
		evalCommentVo.setUserNo(userNo);
		
		int cnt = evalCommentService.insertEvalComment(evalCommentVo);
		
		if(cnt>0) {
			logger.info("평가글 reply 등록결과 성공 cnt={}",cnt);
		}else {
			logger.info("평가글 reply 등록결과 실패 cnt={}",cnt);
		}
		
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/menuinfo/evaluationReplyAdd.do", method = RequestMethod.POST)
	public String reply_post(@ModelAttribute EvalCommentVO evalCommentVo, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("평가글 reply에 댓글 등록하기 파라미터, evalCommentVo={}",evalCommentVo);
		int userNo = (Integer) session.getAttribute("userNo");
		evalCommentVo.setUserNo(userNo);
		
		//db
		int cnt = evalCommentService.insertReply(evalCommentVo);
		logger.info("평가글 reply에 댓글 등록하기 결과, cnt={}",cnt);
		
		if(cnt>0) {
			logger.info("평가글 reply에 댓글 등록결과 성공 cnt={}",cnt);
		}else {
			logger.info("평가글 reply에 댓글 등록결과 실패 cnt={}",cnt);
		}
		
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
}
