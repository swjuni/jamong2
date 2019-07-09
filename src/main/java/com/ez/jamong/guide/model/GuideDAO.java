package com.ez.jamong.guide.model;

import java.util.List;

public interface GuideDAO {
	public int guideAdd(GuideVO guideVo);
	public List<GuideVO> selectAll();
	public GuideVO selectByNo(int guideNo);
	public int updateGuide(GuideVO guideVo);
	public int deleteGuide(int guideNo);
}
