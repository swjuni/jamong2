package com.ez.jamong.bannerEx.model;

import java.util.List;
import java.util.Map;

public interface BannerExService {
	public List<Map<String, Object>> selectAdsAllView();
	public Map<String, Object> selectAdsView(int adsNo);
	public List<BannerExVO> selectAdsAll();
	public BannerExVO selectAdsByNo(int adsNo);
	public int updateActivation(BannerExVO bannerExVo);
	public int updateApprove(BannerExVO vo);
	public int updateDate(BannerExVO vo);
	public int endDate(BannerExVO vo);
}
