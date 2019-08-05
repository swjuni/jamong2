package com.ez.jamong.common;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ez.jamong.categorym.model.CategoryMService;

@Controller
@RequestMapping("/admin")
public class ExcelController {
	private Logger logger=LoggerFactory.getLogger(ExcelController.class);
	@Autowired private FileUploadUtility fileUtility;
	@Autowired private CategoryMService categoryMService;
	
	@Resource(name="fileUploadProperties")
	Properties props;
	
	@RequestMapping(value = "/excelUp.do", method = RequestMethod.POST)
    public String ExcelUp(HttpServletRequest request, Model model){
        logger.info("ExcelUp START");
        int cnt = 0;
        
        //엑셀파일 DB insert 순서
        //1. 파일을 서버에 업로드 처리한다
        //2. 업로한 파일의 변경된 실제 파일명을 가져온다
        //3. 업로드한 경로와 변경된 실제 파일명의 엑셀 파일을 ExcelUtil를 통해서 DB에 insert처리한다
        //4. insert후 서버에 저장된 excel파일은 자동 삭제처리 시킨다
        String fileName="";
		List<Map<String, Object>> fileList =fileUtility.fileUpload(request, FileUploadUtility.EXCEL_UPLOAD);
		String upPath = fileUtility.getUploadPath(request, FileUploadUtility.EXCEL_UPLOAD);
		
		for(int i=0; i<fileList.size();i++) {
			Map<String, Object> map = fileList.get(i);
			fileName=(String)map.get("fileName");
		}
		
		cnt = categoryMService.getExcelUpload(upPath+"\\"+fileName);
		
        logger.info("ExcelUp END");
        
		String msg="", url="";
		if(cnt>0) {
			msg="엑셀업로드 처리 "+cnt+"건 성공";
			url="/admin/categorym/categoryList.do";
			
			//파일 삭제
			if(fileName!=null&&!fileName.isEmpty()){
				File file= new File(upPath, fileName);
				if(file.exists()){
					boolean bool = file.delete();
					logger.info("첨부 파일 삭제 결과 bool={}",bool);
				}
			}//if
			
		}else {
			msg="엑셀업로드 실패";
			url="/admin/categorym/categoryList.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
    }
}