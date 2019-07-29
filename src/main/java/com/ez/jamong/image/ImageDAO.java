package com.ez.jamong.image;

public interface ImageDAO {
	public ImageVO selectByProductNoFirstImage(int productNo);
	public int insertImage(ImageVO imgVo);
}
