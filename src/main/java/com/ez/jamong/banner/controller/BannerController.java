package com.ez.jamong.banner.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.bannerEx.model.BannerExService;
import com.ez.jamong.bannerEx.model.BannerExVO;
import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.common.FileUploadUtility;


@Controller
public class BannerController {
	private Logger logger = LoggerFactory.getLogger(BannerController.class);
	@Autowired private CategoryLService categorylService;
	@Autowired private BannerExService bannerExService;
	@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping(value = "/main/bannerexpoert/bannerAdd.do", method = RequestMethod.GET)
	public String bannerAdd_get(Model model) {
		logger.info("배너 등록 화면 요청");
		
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		model.addAttribute("list", list);
		
		return "main/bannerexpoert/bannerAdd";
	}
	
	@RequestMapping(value = "/main/bannerexpoert/bannerAdd.do", method = RequestMethod.POST)
	public String bannerAdd_post(@ModelAttribute BannerExVO bannerVo, HttpServletRequest request, Model model) {
		logger.info("배너 등록 요청, 파라미터 bannerVo={}", bannerVo);
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.BANNER_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		bannerVo.setFileName(fileName);
		bannerVo.setFileSize(fileSize);
		bannerVo.setOriginalFileName(originalFileName);
		
		bannerVo.setPrice(10000 * bannerVo.getRequestPeriod());
		
		int cnt = bannerExService.insertBanner(bannerVo);
		logger.info("배너 등록 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="배너 등록이 완료되었습니다.";
			url="/main/bannerexpoert/bannerList.do";
		}else {
			msg="배너 등록 실패";
			url="/main/bannerexpoert/bannerAdd.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/main/bannerexpoert/bannerList.do")
	public String bannereList_get(Model model) {
		logger.info("배너 목록 보기");
		
		List<Map<String, Object>> map = bannerExService.selectAdsAllView();
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("map", map);
		
		return "main/bannerexpoert/bannerList";
	}
	
	@RequestMapping(value = "/main/bannerexpoert/bannerDetail.do", method = RequestMethod.GET)
	public String bannereDetail_get(HttpSession session,@RequestParam(defaultValue = "0") int adsNo, @RequestParam(required = false) String activation,  @RequestParam(required = false) String approveDelflag, HttpServletRequest request, Model model) {
		logger.info("배너 상세보기 화면 요청, 파라미터 no={}, activation={}", adsNo, activation);
		logger.info("approveDelflag={}",approveDelflag);

		if(adsNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/bannerexpoert/bannerList.do");
			return "common/message";
		}

		BannerExVO bannerExVo = bannerExService.selectAdsByNo(adsNo);
		logger.info("배너 상세보기 결과 vo={}", bannerExVo);

		Map<String, Object> map = bannerExService.selectAdsView(adsNo);
		logger.info("목록 파라미터, map={}", map);
		
		model.addAttribute("vo", bannerExVo);
		model.addAttribute("map", map);
		
		return "main/bannerexpoert/bannerDetail";
	}
	
	@RequestMapping(value = "/main/bannerexpoert/bannerDelete.do", method = RequestMethod.GET)
	public String bannereDelete_get(@RequestParam(defaultValue = "0") int adsNo, HttpServletRequest request, Model model) {
		logger.info("배너 삭제 화면 요청");
		
		if(adsNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/mypage/mypage.do");
			
			return "common/message";
		}
		
		BannerExVO bannerExVo = bannerExService.selectAdsByNo(adsNo);
		logger.info("배너 삭제보기 결과 vo={}", bannerExVo);
		
		String fileInfo = fileUtility.getFileInfo(request, bannerExVo, FileUploadUtility.BANNER_UPLOAD);
		
		model.addAttribute("vo", bannerExVo);
		model.addAttribute("fileInfo", fileInfo);
		
		
		return "main/bannerexpoert/bannerDelete";
	}
	
	@RequestMapping(value = "/main/bannerexpoert/bannerDelete.do", method = RequestMethod.POST)
	public String bannereDelete_post(@ModelAttribute BannerExVO bannerExVo, HttpServletRequest request, Model model) {
		logger.info("배너 삭제 요청, 파라미터 bannerExVo={}", bannerExVo);
		
		String fileName = bannerExVo.getFileName();
		
		String msg="", url="/main/bannerexpoert/bannerDelete.do?adsNo=" + bannerExVo.getAdsNo();
		
		int cnt = bannerExService.deleteBanner(bannerExVo.getAdsNo());
		logger.info("배너 삭제 처리 결과  cnt={}", cnt);
		
		if(cnt>0) {
			msg="배너가 삭제되었습니다.";
			url="/main/bannerexpoert/bannerList.do";
			
			//파일 삭제
			if(fileName!=null&&!fileName.isEmpty()){
				String upPath = fileUtility.getUploadPath(request, FileUploadUtility.BANNER_UPLOAD);
				
				File file= new File(upPath, fileName);
				if(file.exists()){
					boolean bool = file.delete();
					logger.info("첨부 파일 삭제 결과 bool={}",bool);
				}
			}else {
				msg="첨부 파일이 없는 배너가 삭제 되었습니다.";
				
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/main/bannerexpoert/bannerEdit.do", method = RequestMethod.GET)
	public String bannereEdit_get(@RequestParam(defaultValue = "0") int adsNo, HttpServletRequest request, Model model) {
		logger.info("배너 수정화면 요청");
		
		if(adsNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/mypage/mypage.do");
			
			return "common/message";
		}
		
		List<CategoryLVO> list = categorylService.selectCategorylAll();
		model.addAttribute("list", list);
		
		BannerExVO bannereVo = bannerExService.selectAdsByNo(adsNo);
		logger.info("배너 상세보기 결과 vo={}", bannereVo);
		
		String fileInfo = fileUtility.getFileInfo(request, bannereVo, FileUploadUtility.BANNER_UPLOAD);
		model.addAttribute("vo", bannereVo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("list", list);
		
		return "main/bannerexpoert/bannerEdit";
	}
	
	@RequestMapping(value = "/main/bannerexpoert/bannerEdit.do", method = RequestMethod.POST)
	public String categorymEdit_post(@ModelAttribute BannerExVO bannerVo, @RequestParam String oldFileName, HttpServletRequest request, Model model) {
		logger.info("배너 수정 요청, 파라미터  vo={}, oldFileName={}", bannerVo, oldFileName);
		
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.BANNER_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		bannerVo.setFileName(fileName);
		bannerVo.setFileSize(fileSize);
		bannerVo.setOriginalFileName(originalFileName);
		bannerVo.setPrice(10000 * bannerVo.getRequestPeriod());
		
		int cnt = bannerExService.updateBanner(bannerVo);
		logger.info("업데이트 결과 cnt={}, 파라미터 vo={}", cnt, bannerVo);
		
		String msg="", url="/main/bannerexpoert/bannerEdit.do?adsNo=" + bannerVo.getAdsNo();
		if(cnt>0) {
			msg="배너가 수정되었습니다.";
			url="/mypage/mypage.do";
		
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()){
					String path = fileUtility.getUploadPath(request, FileUploadUtility.BANNER_UPLOAD);
					File oldFile= new File(path, oldFileName);

					if(oldFile.exists()){
						boolean bool = oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}
			
		}else {
			msg="배너 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	/*
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	@RequestMapping("/admin/bannermanager/bannerList.do")
	public String bannermList_get() {
		logger.info("관리자 배너 목록 보기");
		return "admin/bannermanager/bannerList";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerAdd.do", method = RequestMethod.GET)
	public String bannermAdd_get() {
		logger.info("관리자 배너 등록 화면 요청");
		return "admin/bannermanager/bannerAdd";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerAdd.do", method = RequestMethod.POST)
	public String bannermAdd_post() {
		logger.info("관리자 배너 등록 요청");
		return "admin/bannermanager/bannerAdd";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDetail.do", method = RequestMethod.GET)
	public String bannermDetail_get() {
		logger.info("관리자 배너 상세보기 화면 요청");
		return "admin/bannermanager/bannerDetail";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDetail.do", method = RequestMethod.POST)
	public String bannermDetail_post() {
		logger.info("관리자 배너 상세보기 요청");
		return "admin/bannermanager/bannerDetail";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerEdit.do", method = RequestMethod.GET)
	public String  bannermEdit_get() {
		logger.info("관리자 배너 수정 화면 요청");
		return "admin/bannermanager/bannerEdit";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerEdit.do", method = RequestMethod.POST)
	public String bannermEdit_post() {
		logger.info("관리자 배너 수정 요청");
		return "admin/bannermanager/bannerEdit";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDelete.do", method = RequestMethod.GET)
	public String bannermDelete_get() {
		logger.info("관리자 배너 삭제 화면 요청");
		return "admin/bannermanager/bannerDelete";
	}
	
	@RequestMapping(value = "/admin/bannermanager/bannerDelete.do", method = RequestMethod.POST)
	public String bannermDelete_post() {
		logger.info("관리자 배너 삭제 요청");
		return "admin/bannermanager/bannerDelete";
	}
	*/
	
	
	
}
