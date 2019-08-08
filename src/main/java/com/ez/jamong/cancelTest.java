package com.ez.jamong;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class cancelTest {

	public static void main(String[] args) {
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
				System.out.println(access_token);
				
				//결제 정보 호출
				try {
					HttpClient client=HttpClientBuilder.create().build();
					HttpPost post=new HttpPost("https://api.iamport.kr/payments/cancel");
					post.addHeader("Authorization", access_token); // token 이용시
					ArrayList<NameValuePair> postParameters;
					postParameters = new ArrayList<NameValuePair>();
				    postParameters.add(new BasicNameValuePair("imp_uid", "imp_478002601220"));

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
						System.out.println("response is error : " + response.getStatusLine().getStatusCode());
						System.out.println("실패");
					}

				}catch (Exception e) {
					e.printStackTrace();
				}
	}

}
