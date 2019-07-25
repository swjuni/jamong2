package com.ez.jamong.main.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.common.FileUploadUtility;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.userInfo.model.UserInfoService;
import com.ez.jamong.userInfo.model.UserInfoVO;

@Controller
@RequestMapping("/registExpert")
public class RegistExpertController {
	private Logger logger=LoggerFactory.getLogger(RegistExpertController.class);
	@Autowired private UserInfoService userInfoService;
	@Autowired private ExpertService expertService;
	@Autowired private CategoryLService categoryLService;
	@Autowired private FileUploadUtility fileUtility;
	@Autowired private CategoryMService categoryMService;
	
	@RequestMapping("/registExpert.do")
	public String registExpert(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("전문가로 전환 페이지 파라미터 userNo={}",userNo);
		UserInfoVO userInfo=userInfoService.selectByuserNo(userNo);
		ExpertVO expert=expertService.selectByUserNo(userNo);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("expert",expert);
		return "main/mypage/regist_expert";
	}
	
	@RequestMapping("/regist.do")
	public String regist(@ModelAttribute ExpertVO expertVo,Model model) {
		logger.info("전문가 인증들록 파라미터 expertVo={}",expertVo);
		int cnt=expertService.InsertExpert(expertVo);
		String msg="", url="/registExpert/registProfile.do?state=profile&userNo="+expertVo.getUserNo();//페이지 생성하고 바꾸기
		if(cnt>0) {
			msg="저장되었습니다.";
		}else {
			msg="저장에 실패하였습니다.";
			url="/registExpert/registExpert.do?userNo="+expertVo.getUserNo();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/registProfile.do")
	public String registProfile() {
		return "main/mypage/regist_profile";
	}
	
	@RequestMapping(value = "/profile.do",method = RequestMethod.GET)
	public String profile(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("전문가로 전환 프로필 등록 페이지 파라미터 userNo={}",userNo);
		ExpertVO expert=expertService.selectByUserNo(userNo);
		model.addAttribute("expert",expert);
		return "main/mypage/profileFrame";
	}
	
	@RequestMapping(value = "/basic.do", method = RequestMethod.POST)
	public String registBasic(@ModelAttribute ExpertVO expertVo, HttpServletRequest request, HttpSession session,
			Model model, @RequestParam(required = false) String oldFileName) {
		logger.info("전문가 기본 정보 요청, 파라미터 expertVo={}", expertVo);
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.EXPERT_UPLOAD);
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);

			fileName=(String)map.get("fileName");
			originalFileName = (String)map.get("originalFileName");
			fileSize=(Long)map.get("fileSize");
		}
		expertVo.setUserNo((Integer)session.getAttribute("userNo"));
		expertVo.setFileName(fileName);
		expertVo.setFileSize(fileSize);
		expertVo.setOriginalFileName(originalFileName);
		
		int cnt = expertService.saveBasicInfo(expertVo);
		logger.info("전문가 기본 프로필 등록 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="저장 성공";
			url="/registExpert/profile.do?userNo="+expertVo.getUserNo();
			//새로 업로드한 경우, 기존 파일이 있으면 기존파일은 삭제
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUtility.getUploadPath(request, FileUploadUtility.EXPERT_UPLOAD);
					File oldFile=new File(path, oldFileName);
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존 파일 삭제 여부={}", bool);
					}
				}
			}//if
		}else {
			msg="저장 실패";
			url="/registExpert/profile.do?userNo="+expertVo.getUserNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/major.do")
	public String registMajor(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("전문가로 전환 전공 등록 페이지 파라미터 userNo={}",userNo);
		ExpertVO expert=expertService.selectByUserNo(userNo);
		List<CategoryLVO> list=categoryLService.selectCategorylAll();
		model.addAttribute("expert",expert);
		model.addAttribute("list",list);
		return "main/mypage/majorFrame";
	}
	
	@RequestMapping(value = "/submajor.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryMVO> selectSubMajor(@RequestParam(defaultValue = "0") int categoryLNo) {
		logger.info("상세 분야 선택 파라미터 categoryLNo={}", categoryLNo);
		List<CategoryMVO> list=categoryMService.selectCategoryM(categoryLNo);
		logger.info("상세분야 선택 결과 list.size()={}",list.size());
		return list;
	}
}
