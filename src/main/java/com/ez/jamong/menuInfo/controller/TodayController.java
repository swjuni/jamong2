package com.ez.jamong.menuInfo.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.image.ImageService;
import com.ez.jamong.image.ImageVO;
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;

@Controller
public class TodayController {
	private Logger logger = LoggerFactory.getLogger(TodayController.class);
	@Autowired private MenuInfoService menuInfoService;
	@Autowired private ImageService imageService;
	
	//나중에 삭제할 멤버변수
	@Autowired CategoryLService categorylService;
	@Autowired CategoryMService categoryMService;
	
	@RequestMapping("/todayList.do")
	public String todayList(HttpServletRequest request, Model model) {
		//logger.info("최근 본 페이지 요청");
		
		//상품 상세 view에 작성할 쿠키저장 script
		//addCookie.js 파일 사용시
		//addCookie('${vo.productNo}');
		
		MenuInfoVO menuInfo = null;
		ImageVO image = null;
		List<MenuInfoVO> arrMenuInfo = new ArrayList<MenuInfoVO>();//저장소 
		List<ImageVO> arrImageInfo = new ArrayList<ImageVO>();//저장소 
		//쿠키 가져오기
		Cookie[] ck = request.getCookies();
		if(ck!=null){
			for(int i=0;i<ck.length;i++){
				//전송된 쿠키이름 얻어오기
				String ckName=ck[i].getName();
				//logger.info("ckName={}",ckName);
				//쿠키이름에 item이 포함되어 있다면
				if(ckName.indexOf("productItems")!=-1){
					//해당 value얻어오기
					String productValues=ck[i].getValue();
					//logger.info("productValues={}",productValues);
					
					productValues = URLDecoder.decode(productValues);

					//value에 저장된 값에서 /를 split으로 나눠서 배열에 저장
					String[] productNo = productValues.split(",");
					//logger.info("productNo배열={}, size={}",productNo, productNo.length);
					
					for(int j=0; j<productNo.length;j++) {
						if(productNo[j] != null && !productNo[j].isEmpty()){
							//해당 ID값으로 해당 제품 정보 가져오기
							menuInfo = menuInfoService.selectMenuInfoByNo(Integer.parseInt(productNo[j]));
							//logger.info("menuInfo={}",menuInfo);
							if(menuInfo != null) {
								//제품정보에서 조회후 상품 배열에 추가
								arrMenuInfo.add(j, menuInfo);
							}
							
							//해당 ID값으로 해당 제품 이미지 정보 가져오기
							image = imageService.selectByProductNoFirstImage(Integer.parseInt(productNo[j]));
							//logger.info("image={}",image);
							if(image !=null) {
								//제품에 등록된 첫번째 이미지 조회후 이미지 배열에 추가
								arrImageInfo.add(j, image);
							}
						}
					}
				}
			}
		}
		model.addAttribute("ckMenuList", arrMenuInfo);
		model.addAttribute("ckImageList", arrImageInfo);
		return "main/incs/today_view";
	}
	
	
	//나중에 삭제할 임시 화면
	@RequestMapping("/indexTest.do")
	public String main_view(Model model) {
		//logger.info("메인 페이지");
		//카테고리 영역
		List<CategoryLVO> list=categorylService.selectCategorylAll();
		
		model.addAttribute("list",list);
		return "main/index";
	}
}
