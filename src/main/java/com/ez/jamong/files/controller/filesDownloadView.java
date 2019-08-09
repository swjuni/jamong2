package com.ez.jamong.files.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component//bean 상속받을때, ()값을 주지 않으면 클래스명 앞글자소문자로 받아옴
public class filesDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		File file= (File)model.get("downFile");
		if(file==null || !file.exists() || !file.canRead()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('파일이 없거나 손상되었습니다');");
			out.print("history.back();");
			out.print("</script>");
			
			return;
		}
		
		//다운로드 창 바꾸기
		response.setContentType("application/octet-stream");//contenttype을 따로 지정하지 않을때
		
		String fileName = new String(file.getName().getBytes("euc-kr"),"8859_1");
		response.setHeader("Content-disposition", "attachment;fileName"+fileName);
		
		FileInputStream fis = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fis, os);
		
		if(fis!=null) fis.close();
	}


}

