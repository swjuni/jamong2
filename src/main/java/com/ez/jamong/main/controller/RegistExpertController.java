package com.ez.jamong.main.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.ez.jamong.expert_profile.model.ExpertProfileService;
import com.ez.jamong.expert_profile.model.ExpertProfileVO;
import com.ez.jamong.userInfo.model.UserInfoService;
import com.ez.jamong.userInfo.model.UserInfoVO;

@Controller
@RequestMapping("/mypage")
public class RegistExpertController {
	private Logger logger=LoggerFactory.getLogger(RegistExpertController.class);
	@Autowired private UserInfoService userInfoService;
	@Autowired private ExpertService expertService;
	@Autowired private CategoryLService categoryLService;
	@Autowired private FileUploadUtility fileUtility;
	@Autowired private CategoryMService categoryMService;
	@Autowired private ExpertProfileService expertprofileService;
	
	@RequestMapping("/registExpert.do")
	public String registExpert(HttpSession session, Model model) {
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("전문가로 전환 페이지 파라미터 userNo={}",userNo);
		UserInfoVO userInfo=userInfoService.selectByuserNo(userNo);
		ExpertVO expert=expertService.selectByUserNo(userNo);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("expert",expert);
		return "main/mypage/regist_expert";
	}
	
	@RequestMapping("/regist.do")
	public String regist(@ModelAttribute ExpertVO expertVo,Model model,HttpSession session) {
		logger.info("전문가 인증등록 파라미터 expertVo={}",expertVo);
		int userNo=(Integer)session.getAttribute("userNo");
		expertVo.setUserNo(userNo);
		int cnt=expertService.InsertExpert(expertVo);
		String msg="", url="/mypage/registExpert.do?state=expert";//페이지 생성하고 바꾸기
		if(cnt>0) {
			msg="저장되었습니다.";
		}else {
			msg="저장에 실패하였습니다.";
			url="/mypage/registExpert.do?state=expert";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/registProfile.do")
	public String registProfile(HttpSession session, Model model) {
		int userNo=(Integer)session.getAttribute("userNo");
		ExpertVO vo=expertService.selectByUserNo(userNo);
		if(vo==null) {
			model.addAttribute("msg","전문가 등록이 필요합니다.");
			model.addAttribute("url","/mypage/registExpert.do?state=expert");
			return "common/message";
		}
		model.addAttribute("expert",vo);
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
			msg="저장 되었습니다.";
			url="/mypage/profile.do?userNo="+expertVo.getUserNo();
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
			url="/mypage/profile.do?userNo="+expertVo.getUserNo();
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
		ExpertProfileVO epVo=expertprofileService.selectByExpertNo(expert.getExpertNo());
		if(epVo!=null) {
			String[] majorArr=epVo.getMajor().split("/");
			String majorL="";
			for(int i=0;i<majorArr.length;i++) {
				CategoryMVO cmVo=categoryMService.selectCategorymByNo(Integer.parseInt(majorArr[i]));
				if(majorL.indexOf(Integer.toString(cmVo.getCategoryNoL()))==-1){
					majorL+=cmVo.getCategoryNoL()+"/";
				}
			}	
			System.out.println(majorL);
			model.addAttribute("majorM",epVo.getMajor());
			model.addAttribute("majorL",majorL);
		}
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
	
	@RequestMapping(value = "/registMajor.do")
	public String registMajor(@RequestParam(defaultValue = "0") int expertNo,
			@RequestParam String[] major2,Model model, HttpSession session) {
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("전문분야 등록 파라미터 expertNo={}", expertNo);
		ExpertProfileVO vo=new ExpertProfileVO();
		vo.setExpertNo(expertNo);
		String majorExpert="";
		for(int i=0;i<major2.length;i++) {
			majorExpert+=major2[i]+"/";
		}
		vo.setMajor(majorExpert);
		int cnt=expertprofileService.saveProfile(vo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="저장 되었습니다.";
			url="/mypage/major.do?userNo="+userNo;
		}else {
			msg="저장 실패";
			url="/mypage/major.do?userNo="+userNo;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/licenseView.do")
	public String license_view(Model model,HttpSession session) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kurEdKOs6G1DU7HwGyGelpo2O6EeNgwlLl%2F8kk%2FalGnHa4a3hmV0KHsb1v7rHY5v9ezLlSXuVqykOlcobpKcuA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode("kurEdKOs6G1DU7HwGyGelpo2O6EeNgwlLl%2F8kk%2FalGnHa4a3hmV0KHsb1v7rHY5v9ezLlSXuVqykOlcobpKcuA%3D%3D", "UTF-8")); /*발급받은 인증키*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		int expertNo=expertService.selectByUserNo((Integer)session.getAttribute("userNo")).getExpertNo();
		ExpertProfileVO epVo=expertprofileService.selectByExpertNo(expertNo);
		model.addAttribute("license1",sb.toString());
		if(epVo.getLicense()!=null&&!epVo.getLicense().isEmpty()) {
			String[] license=epVo.getLicense().split("/");
			model.addAttribute("license",license);
		}
		return "main/mypage/licenseFrame";
	}

	@RequestMapping(value = "/registLicense.do")
	public String regist_license(Model model,@RequestParam String[] license,HttpSession session){
		int userNo=(Integer)session.getAttribute("userNo");
		int expertNo=expertService.selectByUserNo(userNo).getExpertNo();
		String licen="";
		for(int i=0;i<license.length;i++) {
			licen+=license[i]+"/";
		}
		logger.info("자격증 파라미터={}", licen);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("license", licen);
		map.put("expertNo", expertNo);
		
		int cnt=expertprofileService.updateLicense(map);
		String msg="", url="";
		if(cnt>0) {
			msg="저장 되었습니다.";
			url="/mypage/licenseView.do";
		}else {
			msg="저장 실패";
			url="/mypage/licenseView.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/registCareer.do")
	public String regist_career(Model model,HttpSession session){
		int userNo=(Integer)session.getAttribute("userNo");
		int expertNo=expertService.selectByUserNo(userNo).getExpertNo();
		ExpertProfileVO expertVo=expertprofileService.selectByExpertNo(expertNo);
		if(expertVo.getEducation()!=null&&!expertVo.getEducation().isEmpty()) {
			String[] college=expertVo.getEducation().split("/");
			model.addAttribute("college",college);
		}

		if(expertVo.getCareer()!=null&&!expertVo.getCareer().isEmpty()) {
			String[] career=expertVo.getCareer().split("/");
			model.addAttribute("career",career);
		}

		return "main/mypage/edu_careerFrame";
	}
	
	@RequestMapping(value = "/registCareerData.do")
	public String regist_career_data(Model model,HttpSession session,@RequestParam(required = false, defaultValue = "") String[] career,
			@RequestParam(required = false, defaultValue = "") String[] college){
		int userNo=(Integer)session.getAttribute("userNo");
		int expertNo=expertService.selectByUserNo(userNo).getExpertNo();
		Map<String, Object> map=new HashMap<String, Object>();
		String car="";
		for(int i=0;i<career.length;i++) {
			car+=career[i]+"/";
		}
		logger.info("경력 파라미터={}", car);
		map.put("career", car);
		map.put("expertNo", expertNo);
		
		String col="";
		for(int i=0;i<college.length;i++) {
			col+=college[i]+"/";
		}
		logger.info("학력 파라미터={}", col);
		map.put("college", col);
		int cnt=expertprofileService.updateCareer(map);
		
		String msg="", url="";
		if(cnt>0) {
			msg="프로필등록이 완료 되었습니다.";
			url="/mypage/registCareer.do";
		}else {
			msg="저장 실패";
			url="/mypage/registCareer.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
