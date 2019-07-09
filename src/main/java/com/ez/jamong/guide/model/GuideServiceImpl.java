package com.ez.jamong.guide.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuideServiceImpl implements GuideService{
	@Autowired private GuideDAO guideDao;

	@Override
	public int guideAdd(GuideVO guideVo) {
		return guideDao.guideAdd(guideVo);
	}

	@Override
	public List<GuideVO> selectAll() {
		return guideDao.selectAll();
	}

	@Override
	public GuideVO selectByNo(int guideNo) {
		return guideDao.selectByNo(guideNo);
	}

	@Override
	public int updateGuide(GuideVO guideVo) {
		return guideDao.updateGuide(guideVo);
	}

	@Override
	public int deleteGuide(int guideNo) {
		return guideDao.deleteGuide(guideNo);
	}
	
}
