package com.ez.jamong.bannerEx.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BannerExDAOMybatis implements BannerExDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.banner.";
	
	@Override
	public List<Map<String, Object>> selectAdsAllView() {
		return sqlSession.selectList(namespace + "selectAdsAllView");
	}

	@Override
	public Map<String, Object> selectAdsView(int adsNo) {
		return sqlSession.selectOne(namespace + "selectAdsView", adsNo);
	}

	@Override
	public List<BannerExVO> selectAdsAll() {
		return sqlSession.selectList(namespace + "selectAdsAll");
	}

	@Override
	public BannerExVO selectAdsByNo(int adsNo) {
		return sqlSession.selectOne(namespace + "selectAdsByNo", adsNo);
	}

	@Override
	public int updateActivation(BannerExVO bannerExVo) {
		return sqlSession.update(namespace + "updateActivation", bannerExVo);
	}
	
	@Override
	public int updateApprove(BannerExVO vo) {
		return sqlSession.update(namespace + "updateApprove", vo);
	}

	@Override
	public int updateDate(BannerExVO vo) {
		return sqlSession.update(namespace + "updateDate", vo);
	}

	@Override
	public int endDate(BannerExVO vo) {
		return sqlSession.update(namespace + "endDate", vo);
	}

}
