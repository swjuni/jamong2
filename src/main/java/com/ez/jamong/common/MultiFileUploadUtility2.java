package com.ez.jamong.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.jamong.announcce.model.AnnouncceVO;
import com.ez.jamong.bannerEx.model.BannerExVO;
import com.ez.jamong.categoryl.model.CategoryLVO;
import com.ez.jamong.categorym.model.CategoryMVO;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.message.model.MessageVO;

@Component
public class MultiFileUploadUtility2 {
	private Logger logger = LoggerFactory.getLogger(MultiFileUploadUtility2.class);
	
	//이미지 업로드인지, 자료실 파일 업로드인지 구분하는 상수
	public static final int IMAGE_UPLOAD=1;	//이미지 업로드
	public static final int IMG_DETAIL_UPLOAD=2;	//상세이미지 업로드
	
	@Resource(name="fileUploadProperties")
	Properties props;
	
	public List<Map<String, Object>> multiFileUpload(MultipartFile[] multifiles, HttpServletRequest request,
												int uploadPathGb) {
		//파일 업로드 처리
			List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
			for(int i=0;i<multifiles.length;i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				if(multifiles[i]==null|| multifiles[i].isEmpty()) break;
				MultipartFile tempFile = multifiles[i];	//업로드 파일을 임시파일 형태로 제공
				if(!tempFile.isEmpty()) {
					//업로드 된 경우
					//업로드 된 파일의 파일명
					String originalFileName = tempFile.getOriginalFilename();
					
					//파일명 이름 변경하기
					String fileName = getUniqueFileName(originalFileName);
					
					//파일 크기
					long fileSize = tempFile.getSize();
					
					//업로드 처리
					//업로드 폴더 구하기
					String upPath = getUploadPath(request, uploadPathGb);
					
					File file = new File(upPath, fileName);
					try {
						tempFile.transferTo(file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					map.put("fileName", fileName);
					map.put("fileSize", fileSize);
					map.put("originalFileName", originalFileName);
					
					//map을 list에 저장
				}
				list.add(map);
		}
		logger.info("파일업로드 결과 list.size={}",list.size());
		return list;
	}
	
	public String getUniqueFileName(String fileName) {
		//파일 이름 변경하기
		//ab.txt=> ab + 밀리초 + .txt
		int idx=fileName.lastIndexOf(".");
		Date d = new Date();
		String fName = "", ext="", result="";

		fName = fileName.substring(0, idx);	//ab
		ext = fileName.substring(idx);	//.txt
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String milisec=sdf.format(d);
		
		
		result = fName+"_"+milisec+ext;
		logger.info("파일명 변경 파라미터 fileName={}, 결과값 result={}",fileName, result);
		
		return result;
	}
	
	public String getUploadPath(HttpServletRequest request, int uploadPathGb) {
		//업로드 경로 구하기
		String result="";
		String type = props.getProperty("file.upload.type");
		if(type.equals("test")) {
			//테스트 경로
			if(uploadPathGb==IMAGE_UPLOAD) {
				result = props.getProperty("image.upload.path.test");
			}else if(uploadPathGb==IMG_DETAIL_UPLOAD) {
				result = props.getProperty("img_detail.upload.path.test");
			}
		}else {
			//배포 경로
			String key="";
			if(uploadPathGb==IMAGE_UPLOAD) {
				key="image.upload.path";
			}else if(uploadPathGb==IMG_DETAIL_UPLOAD) {
				key="img_detail.upload.path";
			}
			
			String path = props.getProperty(key);	//pds_upload
			//실제 물리적 경로 구하기
			result = request.getServletContext().getRealPath(path);
		}
		
		logger.info("upload path={}",result);
		return result;
	}
	
	public int deleteFile(int path, String fileName, HttpServletRequest request ) {
		String result="";
		String type = props.getProperty("file.upload.type");
		if(type.equals("test")) {
			//테스트 경로
			if(path==IMAGE_UPLOAD) {
				result = props.getProperty("image.upload.path.test");
			}else if(path==IMG_DETAIL_UPLOAD) {
				result = props.getProperty("img_detail.upload.path.test");
			}
		}else {
			//배포 경로
			String key="";
			if(path==IMAGE_UPLOAD) {
				key="image.upload.path";
			}else if(path==IMG_DETAIL_UPLOAD) {
				key="img_detail.upload.path";
			}
			
			String path2 = props.getProperty(key);	//pds_upload
			//실제 물리적 경로 구하기
			result = request.getServletContext().getRealPath(path2);
		}
		 File file = new File(result, fileName);
		 int cnt=0;
	        if( file.exists() ){
	            if(file.delete()){
	            	cnt=1;
	            	logger.info("파일삭제 성공");
	            }else{
	            	logger.info("파일삭제 실패");
	            }
	        }else{
	        	logger.info("파일이 존재하지 않습니다.");
	        }
	        return cnt;
	}
	
}

