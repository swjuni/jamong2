package com.ez.jamong.image;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ImageVO> selectDelete(List<Integer> list,int productNo) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("productNo", productNo);
		return imageDao.selectDelete(map);
	}

	@Override
	@Transactional
	public int saveImage(List<ImageVO> list, List<Integer> deleteList,int productNo) {
		logger.info("list={},deleteList={}", list.size(),deleteList.size());
		int cnt=0;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", deleteList);
		map.put("productNo", productNo);
		cnt=imageDao.deleteImage(map);
		logger.info("삭제결과 cnt={}",cnt);
		for(int i=0;i<list.size();i++) {
			cnt=imageDao.insertImage(list.get(i));
		}
		return cnt;
	}
	
	
}
