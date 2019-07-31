package com.ez.jamong.log.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.log.model.LogService;
import com.ez.jamong.log.model.LogVO;

@Controller
public class LogController {
	private Logger logger = LoggerFactory.getLogger(LogController.class);
	@Autowired
	private LogService logService;
	
	
	@RequestMapping("/main/userlogin/loginsert.do")
	public String LogInsert(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		LogVO vo = new LogVO();
		
		int userNo = (Integer)session.getAttribute("userNo");
		String ip = getIp(request);
		String os = getOs(request);
		
		vo.setUserNo(userNo);
		vo.setLoginIp(ip);
		vo.setLoginOs(os);
		logger.info("로그기록 vo={}",vo);
		
		int cnt=
		logService.insertLogs(vo);
		
		logger.info("로그기록 vo={}, cnt={}",vo,cnt);
		String msg="",url="/main/index_main.do";
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/admin/manage/log.do")
	public String LogSelect(@RequestParam int userNo, Model model) {
		logger.info("로그기록 화면");
		List<LogVO> list = logService.selectLogsAll();
		
		logger.info("파라미터 userNo={}, 결과값 list.size={}",userNo,list.size());
		model.addAttribute("list",list);
		
		return "admin/manage/log";
	}
	
	/*
	@RequestMapping("/admin/manage/log.do")
	public String LogSelect(@RequestParam int userNo, Model model) {
		logger.info("로그기록 화면");
		List<LogVO> list = logService.selectLogs(userNo);
		
		logger.info("파라미터 userNo={}, 결과값 list.size={}",userNo,list.size());
		model.addAttribute("list",list);
		
		return "admin/manage/log";
	}
	*/
	
	//ip가져오는 함수
	public String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("Proxy-Client-IP"); 
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("WL-Proxy-Client-IP"); 
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("HTTP_CLIENT_IP"); 
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("X-Real-IP"); 
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getHeader("X-RealIP"); 
		 } 
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		     ip = request.getRemoteAddr(); 
		 }
		 return ip;
	}

	//OS가져오는 함수
	public String getOs(HttpServletRequest request) {
		String BigOs = request.getHeader("User-Agent").toLowerCase();
		String os = "";
		logger.info("헤더 정보 = {}",request.getHeader("User-Agent"));
		
        //=================OS=======================
         if (BigOs.indexOf("windows") >= 0 )
         {
             os = "Windows";
         } else if(BigOs.indexOf("mac") >= 0)
         {
             os = "Mac";
         } else if(BigOs.indexOf("x11") >= 0)
         {
             os = "Unix";
         } else if(BigOs.indexOf("android") >= 0)
         {
             os = "Android";
         } else if(BigOs.indexOf("iphone") >= 0)
         {
             os = "IPhone";
         }else{
             os = "UnKnown";
         }
         
         logger.info("OS = {}",os);
         
        
         return os;
	}
	
	
	
}


