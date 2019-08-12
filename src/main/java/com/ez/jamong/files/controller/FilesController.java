package com.ez.jamong.files.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.jamong.common.FileUploadUtility;
import com.ez.jamong.files.model.FilesService;
import com.ez.jamong.files.model.FilesVO;
import com.ez.jamong.message.model.MessageVO;

@Controller
public class FilesController {
	private Logger logger = LoggerFactory.getLogger(FilesController.class);
	@Autowired private FilesService filesService;	
	@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/main/mypage/files.do")
	public String menuinfoList_get(Model model) {
		logger.info("자료실 화면");
		
		return "main/mypage/files";
	}
	
	@RequestMapping("/main/mypage/filesExUser.do")
	public String filesUser(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userno=(Integer)session.getAttribute("userNo");
		logger.info("userno={}",userno);
		List<Map<String, Object>> list1=filesService.selectfileUser(userno);
		List<Map<String, Object>> list2=filesService.selectfileExpert(userno);
		
		logger.info("구매자(일반회원)입장 보낸자료 자료실 list.size={}",list1.size());
		logger.info("판매자(전문가)입장 보낸자료 자료실 list.size={}",list2.size());
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "main/mypage/files";
	}
	
	@RequestMapping(value="/main/mypage/files_send.do",method=RequestMethod.POST)
	public String files_send(@RequestParam int orderNo,
			HttpServletRequest request, Model model) {
		logger.info("파일 전송 파라미터 orderNo={}",orderNo);
		
		//2.파일업로드
		String fileName="", originalFileName="";
		long fileSize=0;
		FilesVO vo = new FilesVO();
		List<Map<String, Object>> fileList=fileUtility.fileUpload(request,FileUploadUtility.FILES_UPLOAD);		
		for(int i=0;i<fileList.size();i++) {
			Map<String, Object> map=fileList.get(i);
			
			fileName=(String) map.get("fileName");
			originalFileName=(String) map.get("originalFileName");
			fileSize=(Long) map.get("fileSize");
		}
		
		vo.setFilesName(fileName);
		vo.setFilesSize(fileSize);
		vo.setOriginalFileName(originalFileName);
		vo.setOrderNo(orderNo);
		
		
		int cnt=0;
		cnt=filesService.insertFiles(vo);
		logger.info("의뢰 자료 전송 결과, cnt={}", cnt);
		
		//3. model에 결과 저장
		String msg="", url="";
		if(cnt>0) {
			msg="의뢰 자료 전송 처리되었습니다.";
			url="/main/mypage/files.do";
		}else {
			msg="의뢰 자료 전송 실패";
			url="/main/mypage/files.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4. 뷰페이지 리턴
		return "common/message";
	}
	
	@RequestMapping("/main/mypage/filesdownload.do")
	public ModelAndView download(
				@RequestParam String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1
		logger.info("파라미터 fileName={}",fileName);
		
		//2
		String path = fileUtility.getUploadPath(request,FileUploadUtility.FILES_UPLOAD);
		File file = new File(path, fileName);
		//3
		//파일객체를 만들어서 보내줌
		//다운로드 창 띄우기
				response.setContentType("application/octet-stream");
				String fileN=new String(fileName.getBytes("euc-kr"),"8859_1");
				response.setHeader("Content-disposition", 
						"attachment;fileName="+ fileN);
				
				FileInputStream fis=new FileInputStream(file);
				OutputStream os = response.getOutputStream();
				
				FileCopyUtils.copy(fis, os);
				
				if(fis!=null) fis.close();
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("downFile", file);
		
		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("filesDownloadView", map);
		
		return mav;
	}
	/*
	@RequestMapping("/main/mypage/filesUser.do")
	@ResponseBody
	public List<FilesVO> filesUser(@RequestParam int userno,Model model) {
		logger.info("ddddddddddddddddd={}",userno);
		List<FilesVO> list = null;
		list=filesService.selectfileUser(userno);
		logger.info("구매자(일반회원)입장 보낸자료 자료실 list.size={}",list.size());
		model
		return list;
	}
	
	@RequestMapping("/main/mypage/filesExpert.do")
	@ResponseBody
	public List<FilesVO> filesExpert(@RequestParam int userno, Model model) {
		List<FilesVO> list = null;
		list=filesService.selectfileExpert(userno);
		logger.info("판매자(전문가)입장 보낸자료 자료실 list.size={}",list.size());
		return list;
	}
	*/
	
}
