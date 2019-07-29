package com.ez.jamong.img_detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ImgDetailServiceImpl implements ImgDetailService{
	@Autowired private ImgDetailDAO imgDetailDao;

	@Override
	@Transactional
	public int insertImgDetail(List<ImgDetailVO> list) {
		int cnt=0;
		for(int i=0;i<list.size();i++) {
			cnt=imgDetailDao.insertImgDetail(list.get(i));
		}
		return cnt;
	}

}
