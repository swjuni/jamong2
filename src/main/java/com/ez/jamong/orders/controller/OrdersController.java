package com.ez.jamong.orders.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.jamong.common.DateSearchVO;
import com.ez.jamong.common.PaginationInfo;
import com.ez.jamong.common.WebUtility;
import com.ez.jamong.orders.model.OrdersService;
import com.ez.jamong.orders.model.OrdersVO;

@Controller
public class OrdersController {
	private Logger logger = LoggerFactory.getLogger(OrdersController.class);
	@Autowired private OrdersService ordersService; 
	
	@RequestMapping("/mypage/orders/buyList.do")
	public String buyList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		dateSearchVo.setUserNo(userNo);
		
		logger.info("구매관리화면 조회 파라미터 vo={}", dateSearchVo);

		//시작일이 null인 경우 현재일자 세팅
		String startDay = dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);
			logger.info("현재 일자 setting후 vo={}",dateSearchVo);
		}
		
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		
		//
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		
		List<Map<String, Object>> list = ordersService.selectByUserNo(dateSearchVo);
		logger.info("구매내역 조회 결과, list.size={}", list.size());

		int totalRecord = ordersService.selectTotalRecord(dateSearchVo);
		logger.info("결제내역-전체 레코드 조회, 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/mypage/buyList";
	}
	
	
	@RequestMapping("/mypage/orders/sellList.do")
	public String sellList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		dateSearchVo.setUserNo(userNo);
		
		logger.info("판매관리화면 조회 파라미터 vo={}", dateSearchVo);
		
		//시작일이 null인 경우 현재일자 세팅
		String startDay = dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);
			logger.info("현재 일자 setting후 vo={}",dateSearchVo);
		}
		
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(WebUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		
		//
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(WebUtility.RECORD_COUNT_PER_PAGE);
		
		List<Map<String, Object>> list = ordersService.expertSelectByUserNo(dateSearchVo);
		logger.info("결제내역 조회 결과, list.size={}", list.size());
		
		int totalRecord = ordersService.expertSelectTotalRecord(dateSearchVo);
		logger.info("결제내역-전체 레코드 조회, 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/mypage/sellList";
	}
	
	@RequestMapping("/mypage/orders/updateProgress.do")
	public String updateProgress(Model model,@ModelAttribute OrdersVO ordersVo, HttpServletRequest request) {
		logger.error("진행상태 업데이트, 파라미터 ordersVo={}", ordersVo);
		String id=ordersVo.getOrderId();
		if(ordersVo.getProgress().equals("C")) {
			String access_token="";
			//토큰 생성
					try {
						URL url = new URL("https://api.iamport.kr/users/getToken"); // 호출할 url
						Map<String,Object> params = new LinkedHashMap<String, Object>(); // 파라미터 세팅
						params.put("imp_key", "7716126096674448");
						params.put("imp_secret", "smNFvl2f5cQgtukp7X8xqBoqQjIkkhwNDks8GvoMHe2bInAQlJnLkMca5Uvqc2dPmGY3bmPTBS4kfFbA");

						StringBuilder postData = new StringBuilder();
						for(Map.Entry<String,Object> param : params.entrySet()) {
							if(postData.length() != 0) postData.append('&');
							postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
							postData.append('=');
							postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
						}
						byte[] postDataBytes = postData.toString().getBytes("UTF-8");

						HttpURLConnection conn = (HttpURLConnection)url.openConnection();
						conn.setRequestMethod("POST");
						conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
						conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
						conn.setDoOutput(true);
						conn.getOutputStream().write(postDataBytes); // POST 호출

						BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

						JSONParser json=new JSONParser();
						String inputLine;
						while((inputLine = in.readLine()) != null) { // response 출력
							JSONObject jsonObject = (JSONObject) json.parse(inputLine);
							JSONObject object=(JSONObject)jsonObject.get("response");
							access_token=(String) object.get("access_token");
						}

						in.close();
						conn.disconnect();
					}catch(Exception e) {
						e.printStackTrace();
					}
					System.out.println(access_token);
					
					//결제 정보 호출
					try {
						HttpClient client=HttpClientBuilder.create().build();
						HttpPost post=new HttpPost("https://api.iamport.kr/payments/cancel");
						post.addHeader("Authorization", access_token); // token 이용시
						ArrayList<NameValuePair> postParameters;
						postParameters = new ArrayList<NameValuePair>();
					    postParameters.add(new BasicNameValuePair("imp_uid",id));

					    post.setEntity(new UrlEncodedFormEntity(postParameters, "UTF-8"));
						HttpResponse response = client.execute(post);
						if (response.getStatusLine().getStatusCode() == 200) {
							ResponseHandler<String> handler = new BasicResponseHandler();
							String body = handler.handleResponse(response);
							JSONParser jsonparser=new JSONParser();
							JSONObject jsonoj=(JSONObject)jsonparser.parse(body);
							System.out.println(jsonoj);
							JSONObject res=(JSONObject)jsonoj.get("response");
						} else {
							
							logger.info("response is error : " + response.getStatusLine().getStatusCode());
							logger.info("실패");
						}

					}catch (Exception e) {
						e.printStackTrace();
					}
		}
		ordersService.updateProgressByOrderNo(ordersVo);
		String referer = request.getHeader("Referer"); 
		return "redirect:"+referer;
	}
	
	@RequestMapping("/main/mypage/manageSell.do") 
	public String sellView() {
		logger.info("수익관리 화면 보여주기");
		return "main/mypage/manageSell";
	}
	
	@RequestMapping("/main/mypage/manageSell_month.do") 
	@ResponseBody
	public Object sellViewMonth(HttpSession session) {
		logger.info("수익관리 화면에 데이터 넘겨주기");
		int userNo=(Integer)session.getAttribute("userNo");
		List<Map<String, Object>> list = ordersService.selectSellerStatistics(userNo);

		return list;
	}
	@RequestMapping("/main/mypage/manageSell_year.do") 
	@ResponseBody
	public Object sellViewYear(HttpSession session) {
		logger.info("수익관리 화면에 데이터 넘겨주기");
		int userNo=(Integer)session.getAttribute("userNo");
		List<Map<String, Object>> list = ordersService.selectSellerStatisticsYear(userNo);
		
		return list;
	}
	
}
