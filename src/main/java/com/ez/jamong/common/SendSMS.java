package com.ez.jamong.common;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class SendSMS {
public static void main(String[] args) {
	
	double rd=(Math.random()*1000000);
	System.out.println(rd);
}
	  
	/*public String sendMessage(String phoneNumber) {
		String api_key = "NCSG2YFPMIYIGS9C";
		String api_secret = "9XASYIJ6KLVSCMIDUFPSTGMNG3TGYZIM";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "phoneNumber");
		params.put("from", "01086634893");
		params.put("type", "SMS");
		params.put("text", "Coolsms Testing Message!");
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
		  JSONObject obj = (JSONObject) coolsms.send(params);
		  System.out.println(obj.toString());
		} catch (CoolsmsException e) {
		  System.out.println(e.getMessage());
		  System.out.println(e.getCode());
		}
	}*/
}
