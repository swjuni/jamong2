package com.ez.jamong.announcce.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.announcce.model.AnnouncceService;
import com.ez.jamong.announcce.model.AnnouncceVO;
import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.SearchVO;

@Controller
@RequestMapping("/main/announcce")
public class AnnouncceServiceController{
	private Logger logger = LoggerFactory.getLogger(AnnouncceServiceController.class);
	@Autowired private AnnouncceService announcceService;
	//@Autowired private FileUploadUtility fileUtility;
	
	@RequestMapping("/announcceServiceList.do")
	public String announcceServiceList_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("서비스 공지사항 화면 요청");

		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setRecordCountPerPage(4);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo에 페이징 관련 변수 셋팅
		searchVo.setRecordCountPerPage(4);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		//[3] 조회처리
		List<AnnouncceVO> list=announcceService.selectSearch(searchVo);
		logger.info("글목록 결과, list.size={}",list.size());
		
		//[4] 전체 레코드 개수 조회
		int totalRecord=0;
		totalRecord=announcceService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 조회 결과, totalRecord={}", totalRecord);
		
		//[5] PaginationInfo에 totalRecord 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		for(int i=0; i<list.size();i++) {
			AnnouncceVO vo = list.get(i);
			String html = vo.getContent();
			html = html.replaceAll("<\\/.*?>", "\r\n");
			logger.info("1차변환 {}",html);
			//html = html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
			html = html.replaceAll("<.*?>","");
			logger.info("2차변환 {}",html);
			html = html.replaceAll("\r\n", "<br>");
			logger.info("3차변환 {}",html);
			for(int j=0;j<5;j++) {
				html=html.replaceAll("<br><br>", "<br>");
			}
			vo.setContent(html);
			logger.info("4차변환 {}",vo.getContent());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/announcce/announcce";
	}
	
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue = "0") int announceNo, Model model) {
		logger.info("공지사항 조회수 증가, 파라미터 announceNo={}", announceNo);
		
		if(announceNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/announcce/announcceServiceList.do");
			
			return "common/message";
		}
		
		int cnt=announcceService.updateReadCount(announceNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/main/announcce/announcceServiceDetail.do?announceNo="+announceNo;
	}
	
	@RequestMapping("/announcceServiceDetail.do")
	public String announcceServiceDetail_get(@RequestParam(defaultValue = "0") int announceNo, Model model) {
		logger.info("공지사항 상세보기 요청");

		if(announceNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/announcce/announcceServiceList.do");
			
			return "common/message";
		}
		
		AnnouncceVO announcceVo=announcceService.selectByNo(announceNo);
		logger.info("상세보기 결과 vo={}", announcceVo);
		
		model.addAttribute("vo", announcceVo);
		
		return "/main/announcce/announcceDetail";
	}
	
	@RequestMapping("/annServiceDetailList.do")
	public String announcceServiceDetailList(@RequestParam(defaultValue = "0") int announceNo, Model model) {
		logger.info("공지사항 상세보기 내부 리스트 요청");
		
		if(announceNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/announcce/announcceServiceList.do");
			
			return "common/message";
		}
		
		int boardCnt = 5;	//게시물의 상하 수량 요청수량
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		//이전글 2개까지 맵에 담기
		int prevAnnounceNo = announceNo;
		AnnouncceVO preVo = null;
		for(int i=0; i<boardCnt; i++) {
			preVo = announcceService.prev(prevAnnounceNo);
			logger.info("preVo 결과 preVo={}", preVo);
			if(preVo!=null) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("announceNo", preVo.getPreNo());
				map.put("title", preVo.getPreTitle());
				list.add(map);
				prevAnnounceNo = preVo.getPreNo();
			}
		}
		
		//보는 글 맵에 담기
		AnnouncceVO announcceVo=announcceService.selectByNo(announceNo);
		logger.info("보는글 Vo 결과 ={}", announcceVo);
		Map<String, Object> mapV = new HashMap<String, Object>();
		mapV.put("announceNo", announcceVo.getAnnounceNo());
		mapV.put("title", announcceVo.getTitle());
		list.add(mapV);
		
		//다음글 2개까지 맵에 담기
		int nextAnnounceNo = announceNo;
		AnnouncceVO nextVo = null;
		for(int i=0; i<boardCnt; i++) {	
			nextVo = announcceService.next(nextAnnounceNo);
			logger.info("nextVo 결과 nextVo={}", nextVo);
			if(nextVo!=null) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("announceNo", nextVo.getNextNo());
				map.put("title", nextVo.getNextTitle());
				list.add(map);
				nextAnnounceNo = nextVo.getNextNo();
			}
		}
		logger.info("내부 리스트 list.size={}",list.size());
		
		//맵에 입력 순서 정렬 안된거 정렬 시키기
		Collections.sort(list, new Comparator<Map<String, Object>>() {

			@Override
			public int compare(Map<String, Object> o1, Map<String, Object> o2) {
				if((Integer)o1.get("announceNo")<(Integer)o2.get("announceNo")) {
					return -1;
				}else if((Integer)o1.get("announceNo")>(Integer)o2.get("announceNo")) {
					return 1;
				}
				return 0;
			}
			
		});
		
		model.addAttribute("list", list);
		return "/main/announcce/annServiceDetailList";
	}

}
