package com.ez.jamong.ads.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdsServiceImpl implements AdsService{
	@Autowired private AdsDAO adsDao;

	@Override
	public List<Map<String, Object>> selectShowAds() {
		return adsDao.selectShowAds();
	}

	@Override
	public List<AdsVO> AgreeAds() {
		return adsDao.AgreeAds();
	}
	
}
