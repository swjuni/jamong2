package com.ez.jamong.packages.model;

import java.util.List;

public interface PackageDAO {
	public int insertPackage(PackageVO vo);
	public List<PackageVO> packageByProductNo(int productNo);
}
