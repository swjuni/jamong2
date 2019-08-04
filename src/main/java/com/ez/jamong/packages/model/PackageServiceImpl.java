package com.ez.jamong.packages.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.menuInfo.model.MenuInfoService;

@Service
public class PackageServiceImpl implements PackageService{
	@Autowired private PackageDAO packageDao;
	@Autowired private MenuInfoService menuInfoService;

	@Override
	@Transactional
	public int insertPackage(List<PackageVO> list) {
		int cnt=0;
		for(int i=0;i<list.size();i++) {
			cnt=packageDao.insertPackage(list.get(i));
		}
		cnt=menuInfoService.registProduct(list.get(0).getProductNo());
		return cnt;
	}

	@Override
	public List<PackageVO> packageByProductNo(int productNo) {
		return packageDao.packageByProductNo(productNo);
	}

	@Override
	public PackageVO selectByPackageNO(int packNo) {
		return packageDao.selectByPackageNO(packNo);
	}
}
