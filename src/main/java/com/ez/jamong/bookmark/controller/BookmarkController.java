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
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.jamong.bookmark.model.BookmarkService;

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
}