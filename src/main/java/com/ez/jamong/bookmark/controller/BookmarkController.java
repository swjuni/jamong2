package com.ez.jamong.bookmark.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.bookmark.model.BookmarkListVO;
import com.ez.jamong.bookmark.model.BookmarkService;
import com.ez.jamong.bookmark.model.BookmarkVO;

@Controller
@RequestMapping("/mypage")
public class BookmarkController {
	private Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	@Autowired private BookmarkService bookmarkService;
	
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
			list.set(i, map);
		}
		
		model.addAttribute("list", list);
		return "main/mypage/bookmark";
	}
	
	@RequestMapping("/bookmarkDel.do")
	public String bookmarkMultiDel(@ModelAttribute BookmarkListVO bookmarkItems, Model model) {
		logger.info("선택한 즐겨찾기 삭제 bookmarkItem={}",bookmarkItems);
		
		List<BookmarkVO> list = bookmarkItems.getBookmarkItems();
		
		int cnt = bookmarkService.bookmarkDelete(list);
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
	
	@RequestMapping("/bookmarkAdd.do")
	public String bookmarkAdd(@RequestParam(defaultValue = "0") int expertNo, HttpSession session, Model model) {
		logger.info("즐겨찾기 등록 요청 파라미터 expertNo={}", expertNo);
		if(expertNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index_main.do");
			
			return "common/message";
		}
		BookmarkVO bookmarkVo = new BookmarkVO();
		bookmarkVo.setUserNo((Integer)session.getAttribute("userNo"));
		bookmarkVo.setExpertNo(expertNo);
		
		int cnt = bookmarkService.bookmarkAdd(bookmarkVo);
		logger.info("즐겨찾기 등록 결과, cnt={}", cnt);
		 
		String msg="", url="";
		if(cnt>0) {
			msg="즐겨찾기 등록 완료.";
			url="/mypage/bookmark.do";
		}else {
			msg="즐겨찾기 등록 실패";
			url="/main/index_main.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}