package com.ez.jamong.categoryl.controller;

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

import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.common.FileUploadUtility;

@Controller
public class CategoryLController {
	private Logger logger = LoggerFactory.getLogger(CategoryLController.class);
	@Autowired private CategoryLService categorylService;
	@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/admin/categoryl/categoryList.do")
	public String categorylList_get(Model model) {
		logger.info("카테고리(대) 목록 요청");
		
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		model.addAttribute("list", list);		
		
		return "admin/categoryl/categoryList";
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryAdd.do", method = RequestMethod.GET)
	public String categorylAdd_get() {
		logger.info("카테고리(대) 등록 화면 요청");
		return "admin/categoryl/categoryAdd";
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryAdd.do", method = RequestMethod.POST)
	public String categorylAdd_post(@ModelAttribute CategoryLVO categoryVo, HttpServletRequest request, Model model) {
		logger.info("카테고리(대) 등록 요청, 파라미터 categoryVo={}", categoryVo);

		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.CATEGORYL_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		categoryVo.setImgName(fileName);
		categoryVo.setImgSize(fileSize);
		categoryVo.setImgOriginalName(originalFileName);
				
		int cnt = categorylService.categorylAdd(categoryVo);
		logger.info("카테고리(대) 등록 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="카테고리(대) " + categoryVo.getCategoryNameL() + " 등록이 완료되었습니다.";
			url="/admin/categoryl/categoryList.do";
		}else {
			msg="카테고리(대) 등록 실패";
			url="/admin/categoryl/categoryAdd.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryDetail.do")
	public String categorylDetail_get(@RequestParam(defaultValue = "0") int categoryNo, HttpServletRequest request, Model model) {
		logger.info("카테고리(대) 상세보기 화면 요청, 파라미터 category={}", categoryNo);
		
		if(categoryNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/categoryl/categoryList.do");
			return "common/message";
		}
		
		CategoryLVO categoryVo = categorylService.selectCategorylByNo(categoryNo);
		logger.info("상세보기 결과 vo={}", categoryVo);
		
		String fileInfo = fileUtility.getFileInfo(request, categoryVo, FileUploadUtility.CATEGORYL_UPLOAD);
		
		model.addAttribute("vo", categoryVo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "admin/categoryl/categoryDetail";
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryEdit.do", method = RequestMethod.GET)
	public String categorylEdit_get(@RequestParam(defaultValue = "0") int categoryNo, HttpServletRequest request, Model model) {
		logger.info("카테고리(대) 수정화면 요청");
		
		if(categoryNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/categoryl/categoryList.do");
			
			return "common/message";
		}
		CategoryLVO categoryVo = categorylService.selectCategorylByNo(categoryNo);
		logger.info("카테고리(대) 상세보기 결과 vo={}", categoryVo);
		
		String fileInfo = fileUtility.getFileInfo(request, categoryVo, FileUploadUtility.CATEGORYL_UPLOAD);
		
		model.addAttribute("vo", categoryVo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "admin/categoryl/categoryEdit";
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryEdit.do", method = RequestMethod.POST)
	public String categorylEdit_post(@ModelAttribute CategoryLVO categoryVo, @RequestParam String oldFileName, HttpServletRequest request, Model model) {
		logger.info("카테고리(대) 수정 요청, 파라미터  vo={}, oldFileName={}", categoryVo, oldFileName);
		
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.CATEGORYL_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		categoryVo.setImgName(fileName);
		categoryVo.setImgSize(fileSize);
		categoryVo.setImgOriginalName(originalFileName);
		
		int cnt = categorylService.updateCategoryl(categoryVo);
		logger.info("업데이트 결과 cnt={}, 파라미터 vo={}", cnt, categoryVo);
		
		String msg="", url="/admin/categoryl/categoryEdit.do?categoryNo=" + categoryVo.getCategoryNo();
		if(cnt>0) {
			msg="카테고리(대)가 수정되었습니다.";
			url="/admin/categoryl/categoryDetail.do?categoryNo=" + categoryVo.getCategoryNo();
		
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()){
					String path = fileUtility.getUploadPath(request, FileUploadUtility.CATEGORYL_UPLOAD);
					File oldFile= new File(path, oldFileName);

					if(oldFile.exists()){
						boolean bool = oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}
			
		}else {
			msg="카테고리(대) 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryDelete.do", method = RequestMethod.GET)
	public String categorylDelete_get(@RequestParam(defaultValue = "0") int categoryNo, HttpServletRequest request, Model model) {
		logger.info("카테고리(대) 삭제 화면 요청");
		
		if(categoryNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/categoryl/categoryList.do");
			
			return "common/message";
		}
		CategoryLVO categoryVo = categorylService.selectCategorylByNo(categoryNo);
		logger.info("카테고리(대) 상세보기 결과 vo={}", categoryVo);
		
		String fileInfo = fileUtility.getFileInfo(request, categoryVo, FileUploadUtility.CATEGORYL_UPLOAD);
		
		model.addAttribute("vo", categoryVo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "admin/categoryl/categoryDelete";
	}
	
	@RequestMapping(value = "/admin/categoryl/categoryDelete.do", method = RequestMethod.POST)
	public String categorylDelete_post(@ModelAttribute CategoryLVO categoryVo, HttpServletRequest request, Model model) {
		logger.info("카테고리(대) 삭제 요청, 파라미터 categoryVo={}", categoryVo);
		
		String fileName = categoryVo.getImgName();
		
		String msg="", url="/admin/categoryl/categoryDelete.do?categoryNo=" + categoryVo.getCategoryNo();
		
		int cnt = categorylService.deleteCategoryl(categoryVo.getCategoryNo());
		logger.info("카테고리(대) 삭제 처리 결과 cnt={} ",cnt);
		
		if(cnt>0) {
			msg="카테고리(대)가 삭제되었습니다.";
			url="/admin/categoryl/categoryList.do";
		
			//파일 삭제
			if(fileName!=null&&!fileName.isEmpty()){
				String upPath = fileUtility.getUploadPath(request, FileUploadUtility.CATEGORYL_UPLOAD);
				
				File file= new File(upPath, fileName);
				if(file.exists()){
					boolean bool = file.delete();
					logger.info("첨부 파일 삭제 결과 bool={}",bool);
				}
			}else {
				msg="첨부 파일이 없는  카테고리(대)가 삭제 되었습니다.";
				
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		
		return "common/message";
	}
	
}
