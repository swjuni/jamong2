package com.ez.jamong.image;

import java.util.List;

import com.ez.jamong.img_detail.ImgDetailVO;

public interface ImageService {
	public ImageVO selectByProductNoFirstImage(int productNo);
	public List<ImageVO> selectImageByProductNo(int productNo);
	public List<ImageVO> selectDelete(List<Integer> list,int productNo);
	public int saveImage(List<ImageVO> list,List<Integer> deleteList,int productNo);
}
