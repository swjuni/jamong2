package com.ez.jamong.expert_profile.model;

public interface ExpertProfileService {
	public int saveProfile(ExpertProfileVO vo);
	public ExpertProfileVO selectByExpertNo(int expertNo);
}
