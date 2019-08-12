package com.ez.jamong.userInfo.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.admin.model.AdminService;
import com.ez.jamong.admin.model.AdminVO;
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.userInfo.model.UserInfoService;
import com.ez.jamong.userInfo.model.UserInfoVO;

@Controller
public class UserInfoController {
	private Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	//암호화 인코더
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Autowired
	UserInfoService userInfoService;
	@Autowired
	ExpertService expertService;
	@RequestMapping("/main/userlogin/login.do")
	public String loginUser() {
		logger.info("로그인 페이지 뷰");
		return "/main/userlogin/login";
	}
	
	@RequestMapping("/main/userlogin/userRegist.do")
	public String registUser() {
		logger.info("회원가입 페이지 뷰");
		return "/main/userlogin/userRegist";
	}
	
	@RequestMapping("/main/userlogin/SearchPwd.do")
	public String SearchUserPwd() {
		logger.info("비밀번호 찾기 페이지 뷰");
		return "/main/userlogin/SearchPwd";
	}
	
	@RequestMapping(value="/main/userlogin/userRegist.do",method = RequestMethod.POST)
	public String registUser_POST(@ModelAttribute UserInfoVO vo,Model model,HttpServletRequest request) {
		logger.info("회원가입 정보 vo={}",vo);
		vo.setUserPwd(encoder.encode(vo.getUserPwd()));
		int cnt = userInfoService.registUser(vo);
		
		logger.info("회원가입 결과 cnt={}",cnt);
		
		String msg="",url="/main/userlogin/userRegist.do";
		if(cnt>0) {
			msg="회원가입 성공!";
			url="/main/userlogin/login.do";
			HttpSession session11 = request.getSession();
			session11.removeAttribute("email");
		}else {
			msg="회원가입 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/main/userlogin/userCheckId.do")
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		logger.info("아이디 중복 검사 파라미터 id={}",id);
		
		int cnt = userInfoService.existUser(id);
		logger.info("아이디 중복 검사 결과 count cnt={}",cnt);
		
		return cnt;
	}
	
	
	@RequestMapping(value="/main/userlogin/login.do",method=RequestMethod.GET)  
	public String loginUser_get() {
		logger.info("회원 로그인화면 보기");
		
		return "main/userlogin/login";
	}
	
	@RequestMapping(value = "/main/userlogin/login.do",method=RequestMethod.POST)
	public String loginUser_post(@RequestParam String userId,
			@RequestParam String pwd,
			@RequestParam (required=false) String saveId,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("유저 로그인 처리 파라미터 userid={}, pwd={}", userId, pwd);
		logger.info("saveId={}",saveId);
		
		int result=userInfoService.userLoginCheck(userId, pwd);
		String msg="",url="/main/userlogin/login.do";
		if(result==UserInfoService.LOGIN_OK) {
			UserInfoVO userVo = userInfoService.selectUser(userId);
			ExpertVO expertVo=expertService.selectByUserNo(userVo.getUserNo());
			HttpSession session = request.getSession();
			if(expertVo!=null) {
				int expertNo=expertVo.getExpertNo();
				session.setAttribute("expertNo", expertNo);
			}
			//세션
			session.setAttribute("userId", userId);
			session.setAttribute("userName", userVo.getUserName());
			session.setAttribute("userAuthor", userVo.getAuthorNo());
			session.setAttribute("userNo", userVo.getUserNo());
			
			//쿠키
			Cookie ck = new Cookie("ck_userid", userId);
			ck.setPath("/");
			if(saveId!=null) {
				ck.setMaxAge(999*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg = "회원 : "+userVo.getUserName()+"님 환영합니다";
			url="/main/userlogin/loginsert.do";
		}else if(result==UserInfoService.PWD_DISAGREE) {
			msg="비밀번호 불일치";
		}else if(result==UserInfoService.ID_NONE) {
			msg="아이디가 존재하지 않습니다";
		}else {
			msg="로그인 처리 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/main/userlogin/logout.do")
	public String userLogout(HttpSession session) {
		logger.info("로그아웃 처리");
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userAuthor");
		session.removeAttribute("userNo");
		session.removeAttribute("expertNo");
		
		return "redirect:/main/index_main.do";
	}
	
	@RequestMapping("/main/mypage/outUser.do")
	public String userOut(HttpSession session) {
		logger.info("회원탈퇴 dododo~");
		int cnt = userInfoService.outUser((String)session.getAttribute("userId"));
		logger.info("회원 탈퇴 결과 cnt={}",cnt);
		
		logger.info("로그아웃 처리");
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userAuthor");
		session.removeAttribute("userNo");
		
		return "redirect:/main/index_main.do";
	}
	
	@RequestMapping("/main/mypage/myInfo.do")
	public String userInfo(HttpSession session,Model model,
			@ModelAttribute UserInfoVO vo) {
		logger.info("회원정보 수정 화면");
		UserInfoVO ivo = userInfoService.selectByuserNo((Integer)session.getAttribute("userNo"));
		model.addAttribute("ivo",ivo);
		
		return "/main/mypage/myInfo";
	}
	
	@RequestMapping(value="/main/mypage/myInfo.do",method = RequestMethod.POST)
	public String userInfo_POST(@ModelAttribute UserInfoVO vo,Model model) {
		logger.info("회원수정 정보 vo={}",vo);
		vo.setUserPwd(encoder.encode(vo.getUserPwd()));
		int cnt = userInfoService.updateUser(vo);
		
		logger.info("회원수정 결과 cnt={}",cnt);
		
		String msg="",url="/mypage/myInfo.do";
		if(cnt>0) {
			msg="회원수정 성공!";
			url="/mypage/mypage.do";
		}else {
			msg="회원가입 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/** 자바 메일 발송 비밀번호 찾기 * @throws MessagingException * @throws AddressException **/ 
	@RequestMapping(value = "/main/userlogin/SearchPwd.do",method = RequestMethod.POST) 
	public void mailSender(HttpServletRequest request, ModelMap mo,@RequestParam String email) throws AddressException, MessagingException{ // 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.daum.net"; 
		
		final String username = "wjsdidgns123"; //네이버 아이디를 입력해주세요.
		final String password = "jamong951753"; //네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		
		
		//20자리 랜덤 코드 생성
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();

		for(int i=0;i<20;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		UserInfoVO vo = new UserInfoVO();
		vo.setUserId(email);
		vo.setUserPwd(encoder.encode(buf));
		logger.info("랜덤 비밀번호 ={}",buf);
		logger.info("email 주소={}",email);
		int cnt=userInfoService.findUserPwd(vo);
		logger.info("이메일 비밀번호 새 코드로 수정 cnt={}",cnt);
		

		// 메일 내용 
		String recipient = email; //받는 사람의 메일주소를 입력해주세요. 
		String subject = "[JAMONG] "+email+"님의 변경된 비밀번호 발송"; //메일 제목 입력해주세요. 
		String body = "[JAMONG] "+username+"님으로 부터 메일을 받았습니다. 변경된 패스워드는 : ["+buf+"]입니다"; //메일 내용 입력해주세요. 
		
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
		
		session.setDebug(true); //for debug 
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("wjsdidgns123@daum.net")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); //제목셋팅 
		mimeMessage.setText(body); //내용셋팅 
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
		
	}
	
	/** 자바 메일 발송 회원가입시 * @throws MessagingException * @throws AddressException **/ 
	@RequestMapping(value = "/main/userlogin/userRegistMail.do",method = RequestMethod.GET) 
	public String mailSender_regist(HttpServletRequest request, ModelMap mo,@RequestParam String email,Model model, HttpSession session) throws AddressException, MessagingException{ // 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.daum.net"; 
		
		final String username = "wjsdidgns123"; //네이버 아이디를 입력해주세요.
		final String password = "jamong951753"; //네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		
		logger.info("email 주소={}",email);

		// 메일 내용 
		String recipient = email; //받는 사람의 메일주소를 입력해주세요. 
		String subject = "[JAMONG] "+email+"님의 확인 이메일 발송"; //메일 제목 입력해주세요. 
		
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
		
		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		
		//Session 생성
		Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
		
		session1.setDebug(true); //for debug 
		String str="<a href=\"http://172.16.146.14:9090/jamong/main/userlogin/sessionEmail.do?email="+email+"\">Email Confirm</a>";
		
		Message mimeMessage = new MimeMessage(session1); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("wjsdidgns123@daum.net")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); //제목셋팅 
		mimeMessage.setContent
	    ("<h1>[JAMONG]</h1>" 
	    	    + str, 
	    	    "text/html"); //내용셋팅 
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
		
		model.addAttribute("email", email);
		
		logger.info("이것이 이메일이다 !!"+email);
		
		return "main/userlogin/userRegist2";
	}
	
	@RequestMapping(value = "/main/userlogin/sessionEmail.do") 
	public String mailSender_session(HttpServletRequest request, ModelMap mo,Model model, HttpSession session, @RequestParam String email) {
		session = request.getSession();
		session.setAttribute("email", email);
		String abc = (String)session.getAttribute(email);
		logger.info("SESSION={}",abc);
		
		return "redirect:/main/userlogin/userRegist.do";
	}
	
	/*message.setContent
    ("<h1>This is a test</h1>" 
    + "<img src=\"http://www.rgagnon.com/images/jht.gif\">", 
    "text/html");*/





}

