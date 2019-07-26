package com.ez.jamong.expert_profile.model;

public interface ExpertProfileDAO {
	public int insertProfile(ExpertProfileVO vo);
	public int updateProfileMajor(ExpertProfileVO vo);
	public int findCount(int expertNo);
	public ExpertProfileVO selectByExpertNo(int expertNo);
}
