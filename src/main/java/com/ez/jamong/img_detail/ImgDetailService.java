package com.ez.jamong.img_detail;

import java.util.List;

public interface ImgDetailService {
	public int insertImgDetail(List<ImgDetailVO> list);
	public List<ImgDetailVO> selectImgDetailByProductNo(int productNo);
	public List<ImgDetailVO> selectDelete(List<Integer> list, int productNo);
	public int saveImgDetail(List<ImgDetailVO> list,List<Integer> deleteList,int productNo);
}
