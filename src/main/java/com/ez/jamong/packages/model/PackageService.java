package com.ez.jamong.packages.model;

import java.util.List;

public interface PackageService {
	public int insertPackage(List<PackageVO> list);
	public List<PackageVO> packageByProductNo(int productNo);
}
