package com.ez.jamong.ads.model;

import java.util.List;
import java.util.Map;

public interface AdsService {
	public List<Map<String, Object>> selectShowAds();
	public List<AdsVO> AgreeAds();
}
