package com.ez.jamong.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageServiceImpl implements ImageService{
	@Autowired private ImageDAO imageDao;

	@Override
	public ImageVO selectByProductNoFirstImage(int productNo) {
		return imageDao.selectByProductNoFirstImage(productNo);
	}
	
	
}
