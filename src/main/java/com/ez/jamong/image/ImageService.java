package com.ez.jamong.image;

import java.util.List;

import com.ez.jamong.img_detail.ImgDetailVO;

public interface ImageService {
	public ImageVO selectByProductNoFirstImage(int productNo);
	public int insertImage(ImageVO imgVo,List<ImgDetailVO> list);
}
