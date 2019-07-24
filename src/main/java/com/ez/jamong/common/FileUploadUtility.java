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
import com.ez.jamong.message.model.MessageVO;

@Component
public class FileUploadUtility {
	private Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);
	
	//이미지 업로드인지, 자료실 파일 업로드인지 구분하는 상수
	public static final int ANNOUNCCE_UPLOAD=1;	//공지사항 업로드
	public static final int FILE_UPLOAD=2;	//자료실 파일 업로드
	public static final int CATEGORYL_UPLOAD=3;	//카테고리(대) 파일 업로드
	public static final int CATEGORYM_UPLOAD=4;	//카테고리(중) 파일 업로드
	public static final int BANNER_UPLOAD=5;	//배너 파일 업로드에 사용
	public static final int MESSAGEFILE_UPLOAD=6;	//메시지 파일 업로드에 사용
	
	@Resource(name="fileUploadProperties")
	Properties props;
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request,
												int uploadPathGb) {
		//파일 업로드 처리
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		
		//파일명, 파일크기를 저장할 Map
		//파일정보가 들어간 Map을 여러개 저장할 List
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next(); //input type이 file인 요소의 name
			
			MultipartFile tempFile = fileMap.get(key);	//업로드 파일을 임시파일 형태로 제공
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
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				map.put("originalFileName", originalFileName);
				
				//map을 list에 저장
				list.add(map);
			}
		}//while
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
			if(uploadPathGb==FILE_UPLOAD) {
				result = props.getProperty("file.upload.path.test");
			}else if(uploadPathGb==ANNOUNCCE_UPLOAD) {
				result = props.getProperty("announcce.upload.path.test");
			}else if(uploadPathGb==CATEGORYL_UPLOAD) {
				result = props.getProperty("category_l.upload.path.test");
			}else if(uploadPathGb==CATEGORYM_UPLOAD) {
				result = props.getProperty("category_m.upload.path.test");
			}else if(uploadPathGb==BANNER_UPLOAD) {
				result = props.getProperty("banner.upload.path.test");
			}else if(uploadPathGb==MESSAGEFILE_UPLOAD) {
				result = props.getProperty("message.upload.path.test");
			}
		}else {
			//배포 경로
			String key="";
			if(uploadPathGb==FILE_UPLOAD) {
				key="file.upload.path";
			}else if(uploadPathGb==ANNOUNCCE_UPLOAD) {
				key="announcce.upload.path";
			}else if(uploadPathGb==CATEGORYL_UPLOAD) {
				key="category_l.upload.path";
			}else if(uploadPathGb==CATEGORYM_UPLOAD) {
				key="category_m.upload.path";
			}else if(uploadPathGb==BANNER_UPLOAD) {
				key="banner.upload.path";
			}else if(uploadPathGb==MESSAGEFILE_UPLOAD) {
				key="message.upload.path";
			}
			String path = props.getProperty(key);	//pds_upload
			//실제 물리적 경로 구하기
			result = request.getServletContext().getRealPath(path);
		}
		
		logger.info("upload path={}",result);
		return result;
	}
	
	public String getFileInfo(HttpServletRequest request, Object objectVo, int uploadPathGb) {

		String result = "";
		String fileName = "";
		String contextPath = "";
		double fileSize = 0.0;
		
		//업로드 경로에 따른 VO구분
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(uploadPathGb==FILE_UPLOAD) {
			
		}else if(uploadPathGb==ANNOUNCCE_UPLOAD) {
			AnnouncceVO vo = (AnnouncceVO) objectVo;
			map = tempInfo(vo.getOriginalFileName(), vo.getFileSize());
		}else if(uploadPathGb==CATEGORYL_UPLOAD) {
			CategoryLVO vo = (CategoryLVO) objectVo;
			map = tempInfo(vo.getImgOriginalName(), vo.getImgSize());
		}else if(uploadPathGb==CATEGORYM_UPLOAD) {
			CategoryMVO vo = (CategoryMVO) objectVo;
			map = tempInfo(vo.getImgOriginalName(), vo.getImgSize());
		}else if(uploadPathGb==BANNER_UPLOAD) {
			BannerExVO vo = (BannerExVO) objectVo;
			map = tempInfo(vo.getOriginalFileName(), vo.getFileSize());
		}else if(uploadPathGb==MESSAGEFILE_UPLOAD) {
			MessageVO vo = (MessageVO) objectVo;
			map = tempInfo(vo.getOriginalFileName(), vo.getFileSize());
		}
		
		fileName = (String)map.get("fileName");
		fileSize = (Double)map.get("fileSize");
		contextPath = request.getContextPath();
		
		if(fileName!=null && !fileName.isEmpty()) {
			fileSize=Math.round((fileSize/1000.0)*10)/10.0;
			
			result="<img src='"+contextPath+"/assets/images/file.gif' alt='file이미지'>";
			result+=fileName+" (" + fileSize+ "KB)";
		}
		return result;
		
	}
	
	public Map<String, Object> tempInfo(String fileName, double fileSize){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("fileSize", fileSize);
		
		return map;
	}
	
}

