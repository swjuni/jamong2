package com.ez.jamong;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Test {

	public static void main(String[] args) throws IOException{
		StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kurEdKOs6G1DU7HwGyGelpo2O6EeNgwlLl%2F8kk%2FalGnHa4a3hmV0KHsb1v7rHY5v9ezLlSXuVqykOlcobpKcuA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode("kurEdKOs6G1DU7HwGyGelpo2O6EeNgwlLl%2F8kk%2FalGnHa4a3hmV0KHsb1v7rHY5v9ezLlSXuVqykOlcobpKcuA%3D%3D", "UTF-8")); /*발급받은 인증키*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
	}
}
