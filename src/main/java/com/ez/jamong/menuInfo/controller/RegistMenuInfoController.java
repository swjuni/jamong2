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
import com.ez.jamong.img_detail.ImgDetailService;
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
	@Autowired private ImageService imageService;
	@Autowired private ImgDetailService imgDetailService;

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
		logger.info("메뉴={}", menuVo);
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
		int userNo=(Integer)session.getAttribute("userNo");
		ExpertVO expertVo=expertService.selectByUserNo(userNo);
		MenuInfoVO menuVo=menuInfoService.NonAvtivatedProduct(expertVo.getExpertNo());
		if(menuVo==null) {
			model.addAttribute("msg","등록진행중인 상품이 없습니다.");
			model.addAttribute("url","/mypage/service.do");
			return "common/message";
		}else {
			ImageVO imgVo=imageService.selectByProductNoFirstImage(menuVo.getProductNo());
			if(imgVo==null) {
				model.addAttribute("msg","기본항목 등록이 완료 되지 않았습니다.");
				model.addAttribute("url","/mypage/service.do");
				return "common/message";
			}
			return "main/mypage/setpackageFrame";
		}
	}
	
	@RequestMapping("/uploadImageView.do")
	public String uploadImageView(@RequestParam(required = true) int productNo,Model model, HttpSession session) {
		logger.info("이미지등록화면 파라미터 productNo={}",productNo);
		List<ImageVO> listImage=imageService.selectImageByProductNo(productNo);
		List<ImgDetailVO> listImgDetail=imgDetailService.selectImgDetailByProductNo(productNo);
		logger.info("등록된 이미지 listImage.size={}, listImgDetail.size={}", listImage.size(), listImgDetail.size());
		model.addAttribute("listImage",listImage);
		model.addAttribute("listImgDetail",listImgDetail);
		model.addAttribute("productNo",productNo);
		return "main/mypage/ImageUpload";
		
	}
	
	@RequestMapping("/imageUpload.do")
	public String imageUpload(@RequestParam(required = true) int productNo,@RequestParam MultipartFile[] imageFiles,
			@RequestParam MultipartFile[] imgDetailFiles,HttpServletRequest request,
			@RequestParam(required = false) List<Integer> imageNoR, @RequestParam(required = false) List<Integer> imgDetailNoR, Model model) {
		logger.info("상품번호 productNo={}", productNo);
		logger.info("파일 개수 imageFiles={}, imgDatailFiles={}", imageFiles.length, imgDetailFiles.length);
		//db에 등록
		//이미지 업로드
		//1.기존에서 삭제한 이미지 삭제
		//삭제해야될거 불러오고 업로드된거에서 지우기
		List<Integer> imageNo=new ArrayList<Integer>();
		List<Integer> imgDetailNo=new ArrayList<Integer>();
		if(imageNoR!=null) {
			imageNo=imageNoR;
		}else {
			imageNo.add(-1);
		}
		if(imgDetailNoR!=null) {
			imgDetailNo=imgDetailNoR;
		}else {
			imgDetailNo.add(-1);
		}
		
		List<ImageVO> listM=imageService.selectDelete(imageNo);
		for(int i=0;i<listM.size();i++) {
			multiFileUploadUtility.deleteFile(MultiFileUploadUtility2.IMAGE_UPLOAD, listM.get(i).getFileName(),request);
		}
		
		List<ImgDetailVO> listD=imgDetailService.selectDelete(imgDetailNo);
		for(int i=0;i<listD.size();i++) {
			multiFileUploadUtility.deleteFile(MultiFileUploadUtility2.IMG_DETAIL_UPLOAD, listD.get(i).getFileName(),request);
		}
		
		//2.새로 생성된 file upload 하고 디비 insert delete 함께
		List<Map<String, Object>> listMU=multiFileUploadUtility.multiFileUpload(imageFiles, request, MultiFileUploadUtility2.IMAGE_UPLOAD);
		List<ImageVO> listMVo=new ArrayList<ImageVO>();
		for(int i=0; i<listMU.size();i++) {
			Map<String, Object> map = listMU.get(i);

			String fileName=(String)map.get("fileName");
			String originalFileName = (String)map.get("originalFileName");
			long fileSize=(Long)map.get("fileSize");
			
			ImageVO imgVo=new ImageVO();
			imgVo.setProductNo(productNo);
			imgVo.setFileName(fileName);
			imgVo.setOriginalFileName(originalFileName);
			imgVo.setFileSize(fileSize);
			listMVo.add(imgVo);
		}
		int cnt=imageService.saveImage(listMVo, imageNo,productNo);
		logger.info("이미지 등록결과 cnt={}",cnt);
		
		List<Map<String, Object>> listDU=multiFileUploadUtility.multiFileUpload(imgDetailFiles, request, MultiFileUploadUtility2.IMG_DETAIL_UPLOAD);
		List<ImgDetailVO> listDVo=new ArrayList<ImgDetailVO>();
		for(int i=0; i<listDU.size();i++) {
			Map<String, Object> map = listDU.get(i);

			String fileName=(String)map.get("fileName");
			String originalFileName = (String)map.get("originalFileName");
			long fileSize=(Long)map.get("fileSize");
			
			ImgDetailVO imgDetailVo=new ImgDetailVO();
			imgDetailVo.setProductNo(productNo);
			imgDetailVo.setFileName(fileName);
			imgDetailVo.setOriginalFileName(originalFileName);
			imgDetailVo.setFileSize(fileSize);
			listDVo.add(imgDetailVo);
		}
		cnt+=imgDetailService.saveImgDetail(listDVo, imgDetailNo,productNo);
		logger.info("상세이미지 등록 결과 cnt={}",cnt);
		String msg="", url="/mypage/uploadImageView.do?productNo="+productNo;
		if(cnt>0) {
			msg="저장되었습니다.";
		}else {
			msg="변경된 데이터가 없습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
		
	}
}
