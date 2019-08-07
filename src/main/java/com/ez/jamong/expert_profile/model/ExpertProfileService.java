package com.ez.jamong.expert_profile.model;

import java.util.Map;

public interface ExpertProfileService {
	public int saveProfile(ExpertProfileVO vo);
	public ExpertProfileVO selectByExpertNo(int expertNo);
	public int updateLicense(Map<String, Object> map);
	public int updateCareer(Map<String, Object> map);
}
