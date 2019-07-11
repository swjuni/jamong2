package com.ez.jamong.bannerEx.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BannerExServiceImpl implements BannerExService{
	@Autowired BannerExDAO bannerExDao;
	
	@Override
	public List<Map<String, Object>> selectAdsAllView() {
		return bannerExDao.selectAdsAllView();
	}

	@Override
	public Map<String, Object> selectAdsView(int adsNo) {
		return bannerExDao.selectAdsView(adsNo);
	}

	@Override
	public List<BannerExVO> selectAdsAll() {
		return bannerExDao.selectAdsAll();
	}

	@Override
	public BannerExVO selectAdsByNo(int adsNo) {
		return bannerExDao.selectAdsByNo(adsNo);
	}

	@Override
	public int updateActivation(BannerExVO bannerExVo) {
		return bannerExDao.updateActivation(bannerExVo);
	}

	@Override
	public int updateApprove(BannerExVO vo) {
		return bannerExDao.updateApprove(vo);
	}

	@Override
	public int updateDate(BannerExVO vo) {
		return bannerExDao.updateDate(vo);
	}

	@Override
	public int endDate(BannerExVO vo) {
		return bannerExDao.endDate(vo);
	}

	@Override
	public int deleteBanner(int adsNo) {
		return bannerExDao.deleteBanner(adsNo);
	}

}
