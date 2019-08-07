package com.ez.jamong.image;

import java.util.List;
import java.util.Map;

public interface ImageDAO {
	public ImageVO selectByProductNoFirstImage(int productNo);
	public int insertImage(ImageVO imgVo);
	public List<ImageVO> selectImageByProductNo(int productNo);
	public List<ImageVO> selectDelete(Map<String, Object> map);
	public int deleteImage(Map<String ,Object> map);
}
