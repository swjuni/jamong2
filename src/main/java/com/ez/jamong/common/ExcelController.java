package com.ez.jamong.common;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.jamong.categorym.model.CategoryMService;

@Controller
@RequestMapping("/admin")
public class ExcelController {
	private Logger logger=LoggerFactory.getLogger(ExcelController.class);
	@Autowired private CategoryMService categoryMService;
	
	@RequestMapping(value = "/excelUp.do", method = RequestMethod.POST)
    public String ExcelUp(HttpServletRequest request, Model model){
        logger.info("ExcelUp START");
        int cnt = 0;

        try { // MultipartHttpServletRequest 생성 
            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request; 
            Iterator<String> iter = mhsr.getFileNames(); 
            MultipartFile mfile = null; 
            String fieldName = ""; 
            
            // 값이 나올때까지
            while (iter.hasNext()) { 
                fieldName = iter.next().toString(); // view페이지 input태그 name을 가져와서 
                logger.info("fieldName={}",fieldName);
                mfile = mhsr.getFile(fieldName);
                logger.info("mfile={}",mfile);
                String fileName; 
                fileName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 // 파일명이 없다면 
                logger.info("fileName={}",fileName);
                
                //String filePath = System.getProperty("java.io.tmpdir") + mhsr.getFile(fieldName).getOriginalFilename();
                
                //위치 및 파일
                cnt = categoryMService.getExcelUpload("C:\\"+fileName);
            }
            
            }catch (UnsupportedEncodingException e) { 
                e.printStackTrace(); 
            }catch (IllegalStateException e) { 
                e.printStackTrace(); 
            }
 
        
        logger.info("ExcelUp END");
        
		String msg="", url="";
		if(cnt>0) {
			msg="엑셀업로드 처리 "+cnt+"건 성공";
			url="/admin/categorym/categoryList.do";
		}else {
			msg="엑셀업로드 실패";
			url="/admin/categorym/categoryList.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
        
    }

}
