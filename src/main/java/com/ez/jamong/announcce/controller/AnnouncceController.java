package com.ez.jamong.announcce.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

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

import com.ez.jamong.announcce.model.AnnouncceListVO;
import com.ez.jamong.announcce.model.AnnouncceService;
import com.ez.jamong.announcce.model.AnnouncceVO;
import com.ez.jamong.common.FileUploadUtility;

@Controller
@RequestMapping("/admin/announcce")
public class AnnouncceController {
	private Logger logger = LoggerFactory.getLogger(AnnouncceController.class);
	@Autowired private AnnouncceService announcceService;
	@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/announcceList.do")
	public String announcceList_get(Model model) {
		logger.info("관리자 보드 공지사항 화면 요청");
		
		List<AnnouncceVO> list = announcceService.selectAll();
		logger.info("공지사항 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/announcce/announcceList";
	}
	
	@RequestMapping(value = "/announcceAdd.do", method = RequestMethod.GET)
	public String announcceAdd_get() {
		logger.info("관리자 보드 공지사항 등록 화면 요청");
		return "admin/announcce/announcceAdd";
	}
	
	@RequestMapping(value = "/announcceAdd.do", method = RequestMethod.POST)
	public String announcceAdd_post(@ModelAttribute AnnouncceVO announcceVo, HttpServletRequest request, Model model) {
		logger.info("관리자 보드 공지사항 등록 요청, 파라미터 announcceVo={}", announcceVo);
		
		//파일 업로드
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.ANNOUNCCE_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		announcceVo.setFileName(fileName);;
		announcceVo.setFileSize(fileSize);
		announcceVo.setOriginalFileName(originalFileName);
		
		announcceVo.setAdminNo(1);	//나중에 admin session 값에 연결된 adminNo 등록해야함
		
		int cnt = announcceService.announcceAdd(announcceVo);
		logger.info("공지사항 등록 결과, cnt={}", cnt);
		 
		String msg="", url="";
		if(cnt>0) {
			msg="글쓰기 처리되었습니다.";
			url="/admin/announcce/announcceList.do";
		}else {
			msg="글쓰기 실패";
			url="/admin/announcce/announcceAdd.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue = "0") int announceNo, 
			Model model) {
		logger.info("조회수 증가, 파라미터 announceNo={}", announceNo);
		
		if(announceNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/announcce/announcceList.do");
			
			return "common/message";
		}
		
		int cnt=announcceService.updateReadCount(announceNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/admin/announcce/announcceDetail.do?announceNo="+announceNo;
	}
	
	@RequestMapping(value = "/announcceDetail.do", method = RequestMethod.GET)
	public String announcceDetail_get(@RequestParam(defaultValue = "0") int announceNo, HttpServletRequest request, Model model) {
		logger.info("관리자 보드 공지사항 상세보기 요청");

		if(announceNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/announcce/announcceList.do");
			
			return "common/message";
		}
		
		AnnouncceVO announcceVo=announcceService.selectByNo(announceNo);
		logger.info("상세보기 결과 vo={}", announcceVo);
		
		String fileInfo = fileUtility.getFileInfo(request, announcceVo, FileUploadUtility.ANNOUNCCE_UPLOAD);
		
		model.addAttribute("vo", announcceVo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "admin/announcce/announcceDetail";
	}
	
	@RequestMapping(value = "/announcceEdit.do", method = RequestMethod.GET)
	public String announcceEdit_get(@RequestParam(defaultValue = "0")int announceNo, HttpServletRequest request, Model model) {
		logger.info("관리자 보드 공지사항 수정 화면 요청");
		
		if(announceNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/announcce/announcceList.do");
			
			return "common/message";
		}
		
		AnnouncceVO announcceVo=announcceService.selectByNo(announceNo);
		logger.info("상세보기 결과 vo={}", announcceVo);
		
		String fileInfo = fileUtility.getFileInfo(request, announcceVo, FileUploadUtility.ANNOUNCCE_UPLOAD);
		
		model.addAttribute("vo", announcceVo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "admin/announcce/announcceEdit";
	}
	
	@RequestMapping(value = "/announcceEdit.do", method = RequestMethod.POST)
	public String announcceEdit_post(@ModelAttribute AnnouncceVO announcceVo, @RequestParam String oldFileName, HttpServletRequest request, Model model) {
		logger.info("글수정 처리, 파라미터 reBoardVo={}, oldFileName={}", announcceVo, oldFileName);
		
		//파일 업로드
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.ANNOUNCCE_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		announcceVo.setFileName(fileName);;
		announcceVo.setFileSize(fileSize);
		announcceVo.setOriginalFileName(originalFileName);
		
		int cnt = announcceService.updateAnnouncce(announcceVo);
		logger.info("업데이트 결과 cnt={}, 파라미터 vo={}",cnt, announcceVo);
		
		String msg="", url="/admin/announcce/announcceEdit.do?announceNo="+announcceVo.getAnnounceNo();
		if(cnt>0) {
			msg="글 수정되었습니다.";
			url="/admin/announcce/announcceDetail.do?announceNo="+announcceVo.getAnnounceNo();
			
			//새로 업로드한 경우, 기존 파일이 있으면 기존파일은 삭제
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()){
					String path = fileUtility.getUploadPath(request, FileUploadUtility.ANNOUNCCE_UPLOAD);
					File oldFile= new File(path, oldFileName);
					//기존파일 삭제
					if(oldFile.exists()){
						boolean bool = oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}//if
		}else {
			msg="글 수정 실패.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/announcceDelete.do", method=RequestMethod.GET)
	public String announcceDelete_get(@ModelAttribute AnnouncceVO announcceVo, HttpServletRequest request, Model model) {
		logger.info("글 삭제 처리, 파라미터 announcceVo={}", announcceVo);
		
		String fileName = announcceVo.getFileName();
		
		String msg="", url="/admin/announcce/announcceDetail.do?announceNo="+announcceVo.getAnnounceNo();
		
		int cnt = announcceService.deleteAnnouncce(announcceVo.getAnnounceNo());
		logger.info("글 삭제처리 결과 cnt={}", cnt);
		if(cnt>0) {
			msg="글 삭제되었습니다.";
			url="/admin/announcce/announcceList.do";
			//파일 삭제
			if(fileName!=null&&!fileName.isEmpty()){
				String upPath = fileUtility.getUploadPath(request, FileUploadUtility.ANNOUNCCE_UPLOAD);
				
				File file= new File(upPath, fileName);
				if(file.exists()){
					boolean bool = file.delete();
					logger.info("첨부 파일 삭제 결과 bool={}",bool);
				}
			}//if
		}else {
			msg="글 삭제 실패";
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteMulti.do")
	public String deleteMulti(@ModelAttribute AnnouncceListVO announcceItems, HttpServletRequest request, Model model) {
		logger.info("선택한 상품들 삭제, announcceItems={}",announcceItems);
		
		List<AnnouncceVO> list = announcceItems.getAnnouncceItems();
		
		//db
		int cnt = announcceService.deleteAnnouncceItems(list);
		logger.info("여러개 상품 삭제 결과, cnt={}", cnt);
		
		//file delete
		String msg="", url="/admin/announcce/announcceList.do";
		if(cnt>0) {
			for(int i=0;i<list.size();i++) {
				AnnouncceVO vo =list.get(i);
				logger.info("{} : AnnounceNo={}",i,vo.getAnnounceNo());
				logger.info("FileName={}", vo.getFileName());
				if(vo.getAnnounceNo()!=0) {
					File file=new File(fileUtility.getUploadPath(request, FileUploadUtility.ANNOUNCCE_UPLOAD), vo.getFileName());
					if(file.exists()) {
						boolean bool = file.delete();
						logger.info("이미지 파일삭제 여부:{}",bool);
					}
				}
			}//for
			
			msg="선택한 상품들이 삭제되었습니다.";
			
		}else {
			msg="선택한 상품 삭제 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

}
