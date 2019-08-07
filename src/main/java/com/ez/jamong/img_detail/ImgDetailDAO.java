package com.ez.jamong.img_detail;

import java.util.List;
import java.util.Map;

public interface ImgDetailDAO {
	public int insertImgDetail(ImgDetailVO imgDetailVo);
	public List<ImgDetailVO> selectImgDetailByProductNo(int productNo);
	public List<ImgDetailVO> selectDelete(List<Integer> list);
	public int deleteImgDetail(Map<String, Object> map);
}
