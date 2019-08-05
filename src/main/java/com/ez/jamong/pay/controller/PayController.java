package com.ez.jamong.pay.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
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
import com.ez.jamong.expert.model.ExpertService;
import com.ez.jamong.expert.model.ExpertVO;
import com.ez.jamong.image.ImageService;
import com.ez.jamong.image.ImageVO;
import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.orders.model.OrdersService;
import com.ez.jamong.orders.model.OrdersVO;
import com.ez.jamong.packages.model.PackageService;
import com.ez.jamong.packages.model.PackageVO;
import com.ez.jamong.pay.model.PayService;
import com.ez.jamong.userInfo.model.UserInfoService;

@Controller
public class PayController {
	private Logger logger = LoggerFactory.getLogger(PayController.class);
	@Autowired private PayService payService;
	@Autowired private MenuInfoService menuInfoService;
	@Autowired private ImageService imageService;
	@Autowired private ExpertService expertService;
	@Autowired private PackageService packageService;
	@Autowired private UserInfoService userInfoService;
	@Autowired private OrdersService ordersService;
	
	@RequestMapping("/mypage/payList/payList.do")
	public String payList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		dateSearchVo.setUserNo(userNo);
		
		logger.info("결제내역 조회 파라미터 vo={}", dateSearchVo);

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
		
		List<Map<String, Object>> list = payService.selectByUserNo(dateSearchVo);
		logger.info("결제내역 조회 결과, list.size={}", list.size());

		int totalRecord = payService.selectTotalRecord(dateSearchVo);
		logger.info("결제내역-전체 레코드 조회, 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/mypage/payList";
	}
	
	@RequestMapping("/main/payCheck.do")
	public String payCheckVeiw(Model model, HttpSession session, @RequestParam(defaultValue = "0") int packageNo) {
		//packageNo받아와야함
		logger.info("packNo={}", packageNo);
		int userNo=(Integer)session.getAttribute("userNo");
		PackageVO packVo=packageService.selectByPackageNO(packageNo);
		int productNo=packVo.getProductNo();
		ImageVO img=imageService.selectByProductNoFirstImage(productNo);
		Map<String, Object> map=menuInfoService.selectMenuinfoView(productNo);
		int expertNo=(Integer)map.get("EXPERT_NO");
		ExpertVO expertVo=expertService.selectByExpertNo(expertNo);
		Map<String, Object> userMap=userInfoService.selectViewByUserNo(userNo);
		model.addAttribute("img",img);
		model.addAttribute("map",map);
		model.addAttribute("expertVo",expertVo);
		model.addAttribute("packVo",packVo);
		model.addAttribute("userMap",userMap);
		return"main/payment/payCheck";
	}
	
	@RequestMapping("/payments/complete/check.do")
	public String checkCorrect(HttpServletRequest request) {
		String result="";
		logger.info("method={}",request.getMethod());
		String imp_uid=request.getParameter("imp_uid");
		logger.info("imp_uid={}",imp_uid);
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.info(access_token);
		OrdersVO orderVo=new OrdersVO();
		//결제 정보 호출
		try {
			HttpClient client=HttpClientBuilder.create().build();
			HttpGet get=new HttpGet("https://api.iamport.kr/payments/"+imp_uid);
			get.addHeader("Authorization", access_token); // token 이용시
			HttpResponse response = client.execute(get);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				JSONParser jsonparser=new JSONParser();
				JSONObject jsonoj=(JSONObject)jsonparser.parse(body);
				System.out.println(jsonoj);
				JSONObject res=(JSONObject)jsonoj.get("response");
				long purchasePrice=(Long)res.get("amount");
				String orderId=(String)res.get("imp_uid");
				String packNo=(String)res.get("name");
				String userNo=(String)res.get("buyer_name");
				logger.info("json={}",res);
				//db에 저장
				orderVo.setOrderId(orderId);
				orderVo.setPackNo(Integer.parseInt(packNo));
				orderVo.setUserNo(Integer.parseInt(userNo));
				orderVo.setPrice(purchasePrice);
				logger.info("orderVo={}",orderVo);
				int cnt=ordersService.insertOrders(orderVo);
				logger.info("DB저장 결과cnt={}",cnt);
				return "redirect:/main/index_main.do";
			} else {
				System.out.println("response is error : " + response.getStatusLine().getStatusCode());
				result="결제 실패";
			}

		}catch (Exception e) {
			logger.info(e.getLocalizedMessage());
			logger.info(e.getStackTrace()+"");
			result="결제 실패";
		}
		return "redirect:/main/index_main.do";
	}//
	
}
