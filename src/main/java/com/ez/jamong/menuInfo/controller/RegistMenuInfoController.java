package com.ez.jamong.menuInfo.controller;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.common.MultiFileUploadUtility2;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.expert_profile.model.ExpertProfileService;
import com.ez.jamong.expert_profile.model.ExpertProfileVO;
import com.ez.jamong.image.ImageService;
import com.ez.jamong.image.ImageVO;
import com.ez.jamong.img_detail.ImgDetailVO;
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;

@Controller
@RequestMapping("/mypage")
public class RegistMenuInfoController {
	private Logger logger=LoggerFactory.getLogger(RegistMenuInfoController.class);
	@Autowired private CategoryLService categoryLService;
	@Autowired private CategoryMService categoryMService;
	@Autowired private MenuInfoService menuInfoService;
	@Autowired private ExpertService expertService;
	@Autowired private ExpertProfileService profileService;
	@Autowired private MultiFileUploadUtility2 multiFileUploadUtility;
	@Autowired private ImageService imgService;

	@RequestMapping("/service.do")
	public String service(Model model, HttpSession session) {
		logger.info("서비스등록 첫화면");
		int userNo=(Integer)session.getAttribute("userNo");
		ExpertVO expertVo=expertService.selectByUserNo(userNo);
		ExpertProfileVO profileVo=profileService.selectByExpertNo(expertVo.getExpertNo());
		if(profileVo==null) {
			String msg="프로필 등록이 필요합니다.";
			String url="/mypage/registProfile.do?state=profile";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
		}else {
			model.addAttribute("expert",expertVo);
			return "main/mypage/regist_service";
		}
	}
	
	@RequestMapping("/serviceFrame.do")
	public String serviceFrame(Model model, HttpSession session) {
		logger.info("서비스프레임 화면");
		int userNo=(Integer)session.getAttribute("userNo");
		ExpertVO expertVo=expertService.selectByUserNo(userNo);
		MenuInfoVO menuVo=menuInfoService.NonAvtivatedProduct(expertVo.getExpertNo());
		List<CategoryLVO> list=categoryLService.selectCategorylAll();
		if(menuVo!=null) {
			Map<String, Object> map=categoryMService.selectCategoryView(menuVo.getCategoryTypeNo());
			String savedCategoryS=String.valueOf(map.get("CATEGORY_NO_L"));
			int savedCategory=Integer.parseInt(savedCategoryS);
			model.addAttribute("savedCategory",savedCategory);
		}
		model.addAttribute("expert",expertVo);
		model.addAttribute("list",list);
		model.addAttribute("menuVo",menuVo);
		return "main/mypage/registServiceFrame";
	}
	
	@RequestMapping("/serviceFrame2.do")
	public String serviceFrame2(Model model, HttpSession session) {
		logger.info("서비스프레임 화면2");
		int userNo=(Integer)session.getAttribute("userNo");
		ExpertVO expertVo=expertService.selectByUserNo(userNo);
		MenuInfoVO menuVo=menuInfoService.NonAvtivatedProduct(expertVo.getExpertNo());
		if(menuVo.getSummary()!=null) {
			model.addAttribute("summarySaved","Y");
		}
		model.addAttribute("menuVo",menuVo);
		return "main/mypage/registServiceFrame2";
	}
	
	@RequestMapping("/registService.do")
	public String registServiceFrame(@ModelAttribute MenuInfoVO menuInfoVo, Model model) {
		int cnt=menuInfoService.saveProduct(menuInfoVo);
		String msg="", url="/mypage/serviceFrame.do";
		if(cnt>0) {
			msg="저장되었습니다.";
		}else {
			msg="저장에 실패하였습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/registService2.do")
	public String registServiceFrame2(@ModelAttribute MenuInfoVO menuInfoVo, Model model,HttpSession session) {
		int userNo=(Integer)session.getAttribute("userNo");
		ExpertVO expertVo=expertService.selectByUserNo(userNo);
		menuInfoVo.setExpertNo(expertVo.getExpertNo());
		int cnt=menuInfoService.updateMenuInfo2(menuInfoVo);
		String msg="", url="/mypage/serviceFrame2.do";
		if(cnt>0) {
			msg="저장되었습니다.";
		}else {
			msg="저장에 실패하였습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/setpackageFrame.do")
	public String setpackageFrame(Model model, HttpSession session) {
		logger.info("패키지 등록 화면");
		return "main/mypage/setpackageFrame";
	}
	
	@RequestMapping("/uploadImageView.do")
	public String uploadImageView(Model model, HttpSession session) {
		logger.info("이미지등록화면");
		return "main/mypage/ImageUpload";
		
	}
	
	@RequestMapping("/imageUpload.do")
	public String imageUpload(@RequestParam(defaultValue = "0") int productNo,@RequestParam MultipartFile[] files,HttpServletRequest request) {
		System.out.println(productNo);
		//메인 사진 저장
		return "redirect: /mypage/uploadImageView.do";
		
	}
}
