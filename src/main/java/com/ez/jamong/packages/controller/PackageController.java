package com.ez.jamong.packages.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.jamong.menuInfo.model.MenuInfoService;
import com.ez.jamong.packages.model.PackageService;
import com.ez.jamong.packages.model.PackageVO;

@Controller
@RequestMapping("/mypage")
public class PackageController {
	private Logger logger=LoggerFactory.getLogger(PackageController.class);
	@Autowired private PackageService packageService;
	@Autowired private MenuInfoService menuInfoService;
	
	@RequestMapping("/registPackage.do")
	public String registSercie(@RequestParam String[] packName, @RequestParam String[] packDesc,HttpSession session,
			@RequestParam int[] packPrice, @RequestParam int[] modifyCount, @RequestParam int[] workingPeriod,
			Model model) {
		List<PackageVO> list=new ArrayList<PackageVO>();
		String[] packLevel= {"STANDARD","DELUXE","PREMUIM"};
		int expertNo=(Integer)session.getAttribute("expertNo");
		int productNo=menuInfoService.NonAvtivatedProduct(expertNo).getProductNo();
		for(int i=0;i<packName.length;i++) {
			PackageVO vo=new PackageVO();
			vo.setPackName(packName[i]);
			vo.setPackLevel(packLevel[i]);
			vo.setPackDesc(packDesc[i]);
			vo.setPackPrice(packPrice[i]);
			vo.setModifyCount(modifyCount[i]);
			vo.setWorkingPeriod(workingPeriod[i]);
			vo.setProductNo(productNo);
			list.add(vo);
			System.out.println(vo);
		}
		logger.info("list.size()={},productNo",list.size(),list.get(0).getProductNo());
		int cnt=packageService.insertPackage(list);
		
		String msg="", url="/mypage/service.do";
		if(cnt>0) {
			msg="서비스가 등록되었습니다.";
		}else {
			msg="등록에 실패하였습니다.";
			url="/mypage/registPackage.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	

}
