package com.ez.jamong.categorym.controller;

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
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.common.FileUploadUtility;

@Controller
public class CategoryMController {
	private Logger logger = LoggerFactory.getLogger(CategoryMController.class);

	@Autowired private CategoryMService categorymService;
	@Autowired private CategoryLService categorylService;
	@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/admin/categorym/categoryList.do")
	public String categorymList_get(Model model) {
		logger.info("카테고리(중) 목록 요청");

		List<Map<String, Object>> map = categorymService.selectCategoryAllView();
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("map", map);
		
		return "admin/categorym/categoryList";
	}
	
	@RequestMapping(value = "/admin/categorym/categoryAdd.do", method = RequestMethod.GET)
	public String categorymAdd_get(Model model) {
		logger.info("카테고리(중) 등록 화면 요청");
		
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		model.addAttribute("list", list);
		
		return "admin/categorym/categoryAdd";
	}
	
	@RequestMapping(value = "/admin/categorym/categoryAdd.do", method = RequestMethod.POST)
	public String categorymAdd_post(@ModelAttribute CategoryMVO categoryVo, HttpServletRequest request, Model model) {
		logger.info("카테고리(중) 등록 요청, 파라미터 categoryVo={}", categoryVo);

		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.CATEGORYM_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		categoryVo.setImgName(fileName);
		categoryVo.setImgSize(fileSize);
		categoryVo.setImgOriginalName(originalFileName);
		
		int cnt = categorymService.categorymAdd(categoryVo);
		logger.info("카테고리(중) 등록 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="카테고리(중) " + categoryVo.getCategoryName() + " 등록이 완료되었습니다.";
			url="/admin/categorym/categoryList.do";
		}else {
			msg="카테고리(중) 등록 실패";
			url="/admin/categorym/categoryAdd.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value = "/admin/categorym/categoryDetail.do")
	public String categorymDetail_get(@RequestParam(defaultValue = "0") int categoryNoM, HttpServletRequest request, Model model) {
		logger.info("카테고리(중) 상세보기 화면 요청, 파라미터 categorynNoM={}", categoryNoM);
		
		if(categoryNoM==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/categorym/categoryList.do");
			return "common/message";
		}
		
		CategoryMVO categoryVo = categorymService.selectCategorymByNo(categoryNoM);
		logger.info("상세보기 결과 vo={}", categoryVo);
		
		Map<String, Object> map = categorymService.selectCategoryView(categoryNoM);
		logger.info("목록 파라미터, map={}", map);
		
		String fileInfo = fileUtility.getFileInfo(request, categoryVo, FileUploadUtility.CATEGORYM_UPLOAD);
		
		model.addAttribute("vo", categoryVo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("map", map);
		
		return "admin/categorym/categoryDetail";
	}
	
	@RequestMapping(value = "/admin/categorym/categoryEdit.do", method = RequestMethod.GET)
	public String categorymEdit_get(@RequestParam(defaultValue = "0") int categoryNoM, HttpServletRequest request, Model model) {
		logger.info("카테고리(중) 수정화면 요청");
		
		if(categoryNoM==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/categorym/categoryList.do");
			
			return "common/message";
		}
		CategoryMVO categoryVo = categorymService.selectCategorymByNo(categoryNoM);
		List<CategoryMVO> list = categorymService.selectCategorymAll();
		logger.info("카테고리(중) 상세보기 결과 vo={}", categoryVo);
		
		String fileInfo = fileUtility.getFileInfo(request, categoryVo, FileUploadUtility.CATEGORYM_UPLOAD);
		model.addAttribute("vo", categoryVo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("list", list);
		
		return "admin/categorym/categoryEdit";
	}
	
	@RequestMapping(value = "/admin/categorym/categoryEdit.do", method = RequestMethod.POST)
	public String categorymEdit_post(@ModelAttribute CategoryMVO categoryVo, @RequestParam String oldFileName, HttpServletRequest request, Model model) {
		logger.info("카테고리(중) 수정 요청, 파라미터  vo={}, oldFileName={}", categoryVo, oldFileName);
		
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.CATEGORYM_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		categoryVo.setImgName(fileName);
		categoryVo.setImgSize(fileSize);
		categoryVo.setImgOriginalName(originalFileName);
		
		int cnt = categorymService.updateCategorym(categoryVo);
		logger.info("업데이트 결과 cnt={}, 파라미터 vo={}", cnt, categoryVo);
		
		String msg="", url="/admin/categorym/categoryEdit.do?categoryNo=" + categoryVo.getCategoryNoM();
		if(cnt>0) {
			msg="카테고리(중)가 수정되었습니다.";
			url="/admin/categorym/categoryDetail.do?categoryNoM=" + categoryVo.getCategoryNoM();
		
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()){
					String path = fileUtility.getUploadPath(request, FileUploadUtility.CATEGORYM_UPLOAD);
					File oldFile= new File(path, oldFileName);

					if(oldFile.exists()){
						boolean bool = oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}
			
		}else {
			msg="카테고리(중) 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping(value = "/admin/categorym/categoryDelete.do", method = RequestMethod.GET)
	public String categorymDelete_get(@RequestParam(defaultValue = "0") int categoryNoM, HttpServletRequest request, Model model) {
		logger.info("카테고리(중) 삭제 화면 요청");
		
		if(categoryNoM==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/categorym/categoryList.do");
			
			return "common/message";
		}
		CategoryMVO categoryVo = categorymService.selectCategorymByNo(categoryNoM);
		logger.info("카테고리(중) 상세보기 결과 vo={}", categoryVo);
		
		String fileInfo = fileUtility.getFileInfo(request, categoryVo, FileUploadUtility.CATEGORYM_UPLOAD);
		
		model.addAttribute("vo", categoryVo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "admin/categorym/categoryDelete";
	}
	
	@RequestMapping(value = "/admin/categorym/categoryDelete.do", method = RequestMethod.POST)
	public String categorymDelete_post(@ModelAttribute CategoryMVO categoryVo, HttpServletRequest request, Model model) {
		logger.info("카테고리(중) 삭제 요청, 파라미터 categoryVo={}", categoryVo);
		
		String fileName = categoryVo.getImgName();
		
		String msg="", url="/admin/categorym/categoryDelete.do?categoryNo=" + categoryVo.getCategoryNoM();
		
		int cnt = categorymService.deleteCategorym(categoryVo.getCategoryNoM());
		logger.info("카테고리(중) 삭제 처리 결과 cnt={} ",cnt);
		
		if(cnt>0) {
			msg="카테고리(중)가 삭제되었습니다.";
			url="/admin/categorym/categoryList.do";
		
			//파일 삭제
			if(fileName!=null&&!fileName.isEmpty()){
				String upPath = fileUtility.getUploadPath(request, FileUploadUtility.CATEGORYM_UPLOAD);
				
				File file= new File(upPath, fileName);
				if(file.exists()){
					boolean bool = file.delete();
					logger.info("첨부 파일 삭제 결과 bool={}",bool);
				}
			}else {
				msg="카테고리(중) 삭제 실패";
				
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		
		return "common/message";
	}
}
