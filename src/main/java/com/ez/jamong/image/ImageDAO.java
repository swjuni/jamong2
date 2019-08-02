package com.ez.jamong.image;

import java.util.List;

public interface ImageDAO {
	public ImageVO selectByProductNoFirstImage(int productNo);
	public int insertImage(ImageVO imgVo);
	public List<ImageVO> selectImageByProductNo(int productNo);
	public List<ImageVO> selectDelete(List<Integer> list);
	public int deleteImage(List<Integer> list);
}
