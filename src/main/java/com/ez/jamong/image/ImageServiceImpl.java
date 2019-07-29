package com.ez.jamong.image;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.img_detail.ImgDetailService;
import com.ez.jamong.img_detail.ImgDetailVO;

@Service
public class ImageServiceImpl implements ImageService{
	@Autowired private ImageDAO imageDao;
	@Autowired private ImgDetailService imgDetailService;

	@Override
	public ImageVO selectByProductNoFirstImage(int productNo) {
		return imageDao.selectByProductNoFirstImage(productNo);
	}

	@Override
	@Transactional
	public int insertImage(ImageVO imgVo, List<ImgDetailVO> list) {
		int cnt=0;
		cnt=imageDao.insertImage(imgVo);
		if(list!=null) {
			cnt=imgDetailService.insertImgDetail(list);
		}
		return cnt;
	}
	
	
}
