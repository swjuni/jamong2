package com.ez.jamong.menuInfo.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.ads.model.AdsService;
import com.ez.jamong.ads.model.AdsVO;
import com.ez.jamong.bookmark.model.BookmarkService;
import com.ez.jamong.bookmark.model.BookmarkVO;
import com.ez.jamong.categoryl.model.CategoryLService;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.SearchVO;
import com.ez.jamong.common.WebUtility;
import com.ez.jamong.evalComment.model.EvalCommentService;
import com.ez.jamong.evalComment.model.EvalCommentVO;
import com.ez.jamong.evaluation.model.EvaluationService;
import com.ez.jamong.evaluation.model.EvaluationVO;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.expert_profile.model.ExpertProfileService;
import com.ez.jamong.expert_profile.model.ExpertProfileVO;
import com.ez.jamong.image.ImageService;
import com.ez.jamong.image.ImageVO;
import com.ez.jamong.img_detail.ImgDetailService;
import com.ez.jamong.img_detail.ImgDetailVO;
import com.ez.jamong.menuInfo.model.MenuInfoExtendsVO;
import com.ez.jamong.menuInfo.model.MenuInfoSearchVO;
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.menuInfo.model.MenuInfoVO;
import com.ez.jamong.packages.model.PackageService;
import com.ez.jamong.packages.model.PackageVO;

@Controller
public class MenuInfoServiceController {
	private Logger logger = LoggerFactory.getLogger(MenuInfoController.class);
	@Autowired private MenuInfoService menuinfoService;
	@Autowired private ExpertService expertService;
	@Autowired private BookmarkService bookmarkService;
	@Autowired private CategoryLService categorylService;
	@Autowired private CategoryMService categoryMService;
	@Autowired private EvaluationService evaluationService;
	@Autowired private EvalCommentService evalCommentService;
	@Autowired private PackageService packageService;
	@Autowired private ImageService imageService;
	@Autowired private ImgDetailService imgDetailservice;
	@Autowired private ExpertProfileService expertProfileService;
	@Autowired
	private AdsService adsService;
	
	@RequestMapping(value = "/main/menuinfo/menuinfo_Detail.do")
	public String menuinfoDetail_get(@RequestParam(defaultValue = "0") int productNo, HttpServletRequest request, HttpSession session,Model model) {
		logger.info("서비스 페이지 상품 상세보기 화면 요청, 파라미터 productNo={}", productNo);
		
		if(productNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index_main.do");
			return "common/message";
		}

		
		MenuInfoVO menuinfoVo = menuinfoService.selectMenuInfoByNo(productNo);
		logger.info("상세보기 결과 vo={}", menuinfoVo);
		
		if(menuinfoVo.getActivation().equals("N")){
			model.addAttribute("msg", "판매 중지된 상품입니다.");
			model.addAttribute("url", "/main/index_main.do");
			return "common/message";
		}
		
		if(menuinfoVo.getActivation()==null || menuinfoVo.getActivation().isEmpty()){
			model.addAttribute("msg", "미승인 상품입니다.");
			model.addAttribute("url", "/main/index_main.do");
			return "common/message";
		}
		
		ExpertVO expertVo = expertService.selectByExpertNo(menuinfoVo.getExpertNo());
		logger.info("expertVo상세보기 결과 vo={}", expertVo);
		
		boolean bookmarkExist = false;
		
		//로그인 안해서 세션 userNo 없는 경우에는 실행안함
		if(session.getAttribute("userNo")!=null) {
			BookmarkVO bookmarkVo = new BookmarkVO();
			bookmarkVo.setUserNo((Integer)session.getAttribute("userNo"));
			bookmarkVo.setExpertNo(expertVo.getExpertNo());
			
			BookmarkVO bookmarkVoExist = new BookmarkVO();
			logger.info("에러 분기점 체크");
			bookmarkVoExist = bookmarkService.bookmarkExist(bookmarkVo);
			if(bookmarkVoExist!=null) {
				bookmarkExist = true;
			}
			logger.info("선택한 상품 기존 bookmark 등록 여부={}",bookmarkExist);
		}
		
		/*
		Map<String, Object> map = menuinfoService.selectMenuinfoView(productNo);
		logger.info("목록 파라미터, map={}", map);
		model.addAttribute("map", map);
		*/
		
		List<EvaluationVO> evalList = evaluationService.evaluationListByPdNo(productNo);
		logger.info("서비스 평가 목록 조회 결과 evalList.size={}",evalList.size());
		
		List<EvalCommentVO>[] evalCommentList = new ArrayList[evalList.size()];
		
		for(int i=0; i<evalList.size();i++) {
			EvaluationVO vo = evalList.get(i);
			int evalNo = vo.getEvalNo();
			
			evalCommentList[i] = evalCommentService.selectByEvalNo(evalNo);
			logger.info("서비스 평가의 댓글 배열 값 evalCommentList{}={}",i, evalCommentList[i]);
		}
		
		
		List<PackageVO> packageList = packageService.packageByProductNo(productNo);
		logger.info("패키지 리스트 결과 packageList={}",packageList);
		
		
		List<ImageVO> imageList = imageService.selectImageByProductNo(productNo);
		logger.info("이미지 리스트 결과 imageList={}",imageList);
		List<ImgDetailVO> imgDetailList = imgDetailservice.selectImgDetailByProductNo(productNo);
		logger.info("이미지디테일 리스트 결과 imgDetailList={}",imgDetailList);
		
		ExpertProfileVO expertProfileVO=expertProfileService.selectByExpertNo(menuinfoVo.getExpertNo());
		
		List<CategoryMVO> cmList = new ArrayList<CategoryMVO>();
		if(expertProfileVO!=null) {
			String[] majorArr=expertProfileVO.getMajor().split("/");
			for(int i=0;i<majorArr.length;i++) {
				CategoryMVO cmVo=categoryMService.selectCategorymByNo(Integer.parseInt(majorArr[i]));
				cmList.add(cmVo);
			}	
		}
		
		String ProductUserid=menuinfoService.selectFromProductUserId(productNo);
		
		model.addAttribute("ProductUserid", ProductUserid);
		model.addAttribute("majorList",cmList);
		model.addAttribute("packageList", packageList);
		model.addAttribute("evalList", evalList);
		model.addAttribute("menuinfoVo", menuinfoVo);
		model.addAttribute("expertVo", expertVo);
		model.addAttribute("bookmarkExist", bookmarkExist);
		model.addAttribute("evalCommentList", evalCommentList);
		model.addAttribute("imageList", imageList);
		model.addAttribute("imgDetailList", imgDetailList);
		model.addAttribute("expertProfileVO", expertProfileVO);
		
		return "main/menuinfo/menuinfo_Detail";
	}
	
	@RequestMapping(value = "/main/menuinfo/menuListCategoryM.do")
	public String showCategoryMimg(@ModelAttribute MenuInfoSearchVO searchVo, Model model) {
		logger.info("카테고리(중) 목록 파라미터 categoryLNo={}", searchVo);
		List<CategoryMVO> list=categoryMService.selectCategoryM(searchVo.getCategoryNoL());
		logger.info("카테고리(중) 목록 리스트 list.size={}",list.size());
		
		String categoryNameL = "";
		CategoryLVO categoryLVO = categorylService.selectCategorylByNo(searchVo.getCategoryNoL());
		logger.info("카테고리(대) 이름 categoryNameL={}",categoryNameL);
		if(categoryLVO!=null) {
			categoryNameL = categoryLVO.getCategoryNameL();
		}
		
		String expertName = "";
		ExpertVO expertVo = expertService.selectByExpertNo(searchVo.getExpertNo());
		logger.info("전문가 epxertVo={}",expertVo);
		if(expertVo!=null) {
			expertName = expertVo.getId();
		}
		
		model.addAttribute("cmList",list);
		model.addAttribute("categoryNameL", categoryNameL);
		model.addAttribute("expertName", expertName);
		return "main/incs/menuListCategoryM";
	}

	@RequestMapping(value = "/main/menuinfo/menuinfo_List.do")
	public String menuinfoList_get(@ModelAttribute MenuInfoSearchVO searchVo, Model model) {
		logger.info("카테고리별 상품 리스트 목록, 파라미터 searchVo={}", searchVo);
		
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setRecordCountPerPage(8);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(8);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		//[3] 조회처리
		List<MenuInfoExtendsVO> list=menuinfoService.menuinfoByList(searchVo);
		logger.info("카테고리 목록 조회 결과, list.size={}",list.size());
		
		String cNameM="", cNameL="", epName="";
		if(searchVo.getCategoryNoM()!=0) {
			cNameM = categoryMService.selectCategorymByNo(searchVo.getCategoryNoM()).getCategoryName();
		}
		if(searchVo.getCategoryNoL()!=0) {
			cNameL = categorylService.selectCategorylByNo(searchVo.getCategoryNoL()).getCategoryNameL();
		}
		if(searchVo.getExpertNo()!=0) {
			epName = expertService.selectByExpertNo(searchVo.getExpertNo()).getId();
		}
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=menuinfoService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//베너 리스트
		List<AdsVO> adlist = adsService.AgreeAds();
		
		model.addAttribute("adlist", adlist);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("cNameL", cNameL);
		model.addAttribute("cNameM", cNameM);
		model.addAttribute("epName", epName);
		
		return "main/menuinfo/menuinfo_List";
	}
	
	@RequestMapping("/mypage/expert/menuList.do")
	public String service_list(@ModelAttribute SearchVO searchVo, Model model,HttpSession session) {
		int expertNo=expertService.selectByUserNo((Integer)session.getAttribute("userNo")).getExpertNo();
		//2
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(3);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(3);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		//[3] 조회처리
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("expertNo", expertNo);
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("recordCountPerPage", searchVo.getRecordCountPerPage());
		map.put("searchKeyword", searchVo.getSearchKeyword());
		List<Map<String, Object>> list=menuinfoService.selectByExpertNo(map);
		logger.info("글목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		Map<String, Object> map1=new HashMap<String, Object>();
		map1.put("expertNo", expertNo);
		map1.put("searchKeyword", searchVo.getSearchKeyword());
		totalRecord=menuinfoService.countByExpertNo(map1);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("sk", searchVo.getSearchKeyword());
		model.addAttribute("pagingInfo", pagingInfo);
		logger.info("paginInfo={}",pagingInfo.getFirstPage());
		logger.info("paginInfo={}",pagingInfo.getLastPage());
		return "main/mypage/serviceList";
	}
	
	@RequestMapping("/mypage/expert/delete.do")
	@ResponseBody
	public String delete(@RequestParam int no) {
		int cnt=menuinfoService.deleteProduct(no);
		if(cnt>0) {
			return "s";
		}else {
			return "f";
			
		}
	}
}