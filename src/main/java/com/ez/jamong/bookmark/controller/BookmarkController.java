package com.ez.jamong.bookmark.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Clob;
import java.sql.SQLException;
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

import com.ez.jamong.bookmark.model.BookmarkListVO;
import com.ez.jamong.bookmark.model.BookmarkService;
import com.ez.jamong.bookmark.model.BookmarkVO;
import com.ez.jamong.categorym.model.CategoryMService;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.expert_profile.model.ExpertProfileService;
import com.ez.jamong.expert_profile.model.ExpertProfileVO;

@Controller
@RequestMapping("/mypage")
public class BookmarkController {
	private Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	@Autowired private BookmarkService bookmarkService;
	@Autowired private ExpertService expertService;
	@Autowired private ExpertProfileService expertProfileService;
	@Autowired private CategoryMService categoryMService;
	
	@RequestMapping("/bookmark.do")
	public String bookmark(HttpSession session, Model model) {
		logger.info("즐겨찾기 화면 요청");
		
		int userNo = (Integer)session.getAttribute("userNo");	//세션 userNo

		List<Map<String, Object>> list = bookmarkService.bookmarkList(userNo);
		logger.info("즐겨찾기 목록 요청 결과 list.size={}, userNo={}",list, userNo);
		
		StringBuffer strOut = null;
		Map<String, Object> map = null;
		
		for(int i=0; i<list.size();i++) {
			map = list.get(i);
			if(map.get("INTRODUCTION") instanceof java.sql.Clob) {
				strOut = new StringBuffer();
				String str="";
				Clob clob = (java.sql.Clob)map.get("INTRODUCTION");
				BufferedReader br;
				try {
					br = new BufferedReader(clob.getCharacterStream());
					while((str=br.readLine())!=null) {
						strOut.append(str+"<br>");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			map.put("INTRODUCTION", strOut);
			
			BigDecimal expertNo = (BigDecimal) map.get("EXPERT_NO");
			ExpertProfileVO expertProfileVO=expertProfileService.selectByExpertNo(expertNo.intValue());
			if(expertProfileVO!=null) {
				String[] majorArr=expertProfileVO.getMajor().split("/");
				CategoryMVO cmVo=categoryMService.selectCategorymByNo(Integer.parseInt(majorArr[0]));
				map.put("MAJOR", cmVo.getCategoryName());
			}
			
			list.set(i, map);
		}
		
		model.addAttribute("list", list);
		return "main/mypage/bookmark";
	}
	
	@RequestMapping("/bookmarkDel.do")
	public String bookmarkMultiDel(@ModelAttribute BookmarkListVO bookmarkItems, Model model) {
		logger.info("선택한 즐겨찾기 삭제 bookmarkItem={}",bookmarkItems);
		
		List<BookmarkVO> list = bookmarkItems.getBookmarkItems();
		
		int cnt = bookmarkService.bookmarkDeleteList(list);
		logger.info("선택한 즐겨찾기 삭제 결과, cnt={}", cnt);
		
		String msg="", url="/mypage/bookmark.do";
		if(cnt>0) {
			msg="선택한 즐겨찾기가 삭제되었습니다.";
			
		}else {
			msg="선택한 즐겨찾기 삭제 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("bookmarkExist.do")
	@ResponseBody
	public int bookmarkExist(@RequestParam(defaultValue = "0") int expertNo, HttpSession session, HttpServletRequest request) {
		logger.info("즐겨찾기 상태 확인 파라미터 expertNo={}", expertNo);
		
		int result = -1;
		if(expertNo!=0) {
			BookmarkVO bookmarkVo = new BookmarkVO();
			bookmarkVo.setUserNo((Integer)session.getAttribute("userNo"));
			bookmarkVo.setExpertNo(expertNo);
			
			BookmarkVO bookmarkVoExist = new BookmarkVO();
			bookmarkVoExist = bookmarkService.bookmarkExist(bookmarkVo);
			if(bookmarkVoExist!=null) {	//기존에 즐겨찾기 상태 - 등록된 즐겨찾기를 삭제하는 메서드
				int cnt = bookmarkService.bookmarkDelete(bookmarkVoExist.getBookmarkNo());
				logger.info("즐겨찾기 삭제 결과, cnt={}", cnt);
				if(cnt>0) result=0;
			}else {	//기존에 즐겨찾기 상태가 아님 - 즐겨찾기 등록 처리
				//expertNo 존재여부 검증 추가
				ExpertVO expertVo = expertService.selectByExpertNo(expertNo);
				logger.info("expertVo상세보기 결과 vo={}", expertVo);
				if(expertVo!=null) {
					int cnt = bookmarkService.bookmarkAdd(bookmarkVo);
					logger.info("즐겨찾기 등록 결과, cnt={}", cnt);
					if(cnt>0) result=1;
				}
			}
		}
		
		//페이지 직접 로딩으로 반환할 경우 아래 코드 사용 반환타입도 String으로 변경
		//String referer = request.getHeader("Referer");
		//return "redirect:"+referer;
		
		//ajax 방식으로 반환할 경우 아래 값 리턴
		return result;
	}
}