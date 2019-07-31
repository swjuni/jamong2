package com.ez.jamong.admin.controller;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.common.FileUploadUtility;
import com.ez.jamong.message.model.MessageService;
import com.ez.jamong.message.model.MessageVO;
import com.ez.jamong.userInfo.model.UserInfoService;

//전체 이메일 발송
@Controller
public class SendMesaageController {
	private Logger logger = LoggerFactory.getLogger(SendMesaageController.class);
	
	@Autowired private MessageService messageService;	
	@Autowired private FileUploadUtility fileUtility;
	@Autowired private UserInfoService userInfoservice;
	
	@RequestMapping("/admin/manage/send.do")
	public String Sender() {
		logger.info("단체메일 전송 화면");
		return "admin/manage/send";
	}
	
	/** 자바 메일 발송 * @throws MessagingException * @throws AddressException **/ 
	@RequestMapping(value = "/admin/manage/send_email.do",method = RequestMethod.POST)
	public void mailSender(HttpServletRequest request, ModelMap mo,@RequestParam String subjectemail,@RequestParam String text) throws AddressException, MessagingException{ // 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다.
		logger.info("메일 보내기");
		logger.info("파라미터 제목={}, 내용{}",subjectemail,text);
		String host = "smtp.daum.net"; 
		
		final String username = "wjsdidgns123"; //다음 아이디를 입력해주세요.
		final String password = "jamong951753"; //다음 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		
		// 메일 내용 
		
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
		
		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		
		//Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
		String subject = "[JAMONG] "+subjectemail; //메일 제목 입력해주세요. 
		String body = text; //메일 내용 입력해주세요. 
		session.setDebug(true); //for debug 
		List<String> useremail=userInfoservice.AllUserEmail();
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		for(int i=0;i<useremail.size();i++) {
			String recipient = useremail.get(i);/* "wjsdidgns@naver.com" *///받는 사람의 메일주소를 입력해주세요. 
			mimeMessage.setFrom(new InternetAddress("wjsdidgns123@daum.net")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
			mimeMessage.setSubject(subject); //제목셋팅 
			mimeMessage.setText(body); //내용셋팅 
			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
		}
		
		
	}
	
	
		@RequestMapping(value = "/admin/manage/send_message.do",method = RequestMethod.POST) 
		public String messageSender(HttpServletRequest request, Model model,
				@RequestParam String subjectemail,@RequestParam String text) {
			logger.info("쪽지 보내기");
			logger.info("파라미터 제목={}, 내용{}",subjectemail,text);
		
		//2.파일업로드
		String fileName="", originalFileName="";
		long fileSize=0;
		List<Map<String, Object>> fileList=fileUtility.fileUpload(request,FileUploadUtility.MESSAGEFILE_UPLOAD);		
		for(int i=0;i<fileList.size();i++) {
			Map<String, Object> map=fileList.get(i);
			
			fileName=(String) map.get("fileName");
			originalFileName=(String) map.get("originalFileName");
			fileSize=(Long) map.get("fileSize");
		}
		MessageVO vo = new MessageVO();
		List<String> userIdList=userInfoservice.AllUserEmail();
		int samcnt=1;
		int cnt=0;
		for(String uo : userIdList) {
			vo.setUserId("123@naver.com");
			vo.setUserId2(uo);
			vo.setContents("제목 : "+subjectemail+"\n내용 : "+text);
			
			vo.setFileName(fileName);
			vo.setFileSize(fileSize);
			vo.setOriginalFileName(originalFileName);
			
			cnt=messageService.insertMessage(vo);
			samcnt*=cnt;
			logger.info("메시지 전송 email 주소={}",vo.getUserId2());
			logger.info("메시지 전송 결과, cnt={}", cnt);
		}
		
		//3. model에 결과 저장
		String msg="", url="/admin/manage/send.do";
		if(samcnt>0) {
			msg="메시지 전송 처리되었습니다.";
		}else {
			msg="메시지 최종 전송 실패, 주소값 확인";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4. 뷰페이지 리턴
		return "common/message";
	}
}
