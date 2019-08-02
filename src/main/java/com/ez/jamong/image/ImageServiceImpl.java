package com.ez.jamong.image;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.img_detail.ImgDetailService;
import com.ez.jamong.img_detail.ImgDetailVO;

@Service
public class ImageServiceImpl implements ImageService{
	Logger logger=LoggerFactory.getLogger(ImageServiceImpl.class);
	@Autowired private ImageDAO imageDao;
	@Autowired private ImgDetailService imgDetailService;

	@Override
	public ImageVO selectByProductNoFirstImage(int productNo) {
		return imageDao.selectByProductNoFirstImage(productNo);
	}

	@Override
	public List<ImageVO> selectImageByProductNo(int productNo) {
		return imageDao.selectImageByProductNo(productNo);
	}

	@Override
	public List<ImageVO> selectDelete(List<Integer> list) {
		return imageDao.selectDelete(list);
	}

	@Override
	@Transactional
	public int saveImage(List<ImageVO> list, List<Integer> deleteList) {
		logger.info("list={},deleteList={}", list.size(),deleteList.size());
		int cnt=0;
		cnt=imageDao.deleteImage(deleteList);
		for(int i=0;i<list.size();i++) {
			cnt=imageDao.insertImage(list.get(i));
		}
		return cnt;
	}
	
	
}
