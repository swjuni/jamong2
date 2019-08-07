package com.ez.jamong.img_detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ImgDetailServiceImpl implements ImgDetailService{
	Logger logger=LoggerFactory.getLogger(ImgDetailServiceImpl.class);
	@Autowired private ImgDetailDAO imgDetailDao;

	@Override
	@Transactional
	public int insertImgDetail(List<ImgDetailVO> list) {
		int cnt=0;
		for(int i=0;i<list.size();i++) {
			cnt=imgDetailDao.insertImgDetail(list.get(i));
		}
		return cnt;
	}

	@Override
	public List<ImgDetailVO> selectImgDetailByProductNo(int productNo) {
		return imgDetailDao.selectImgDetailByProductNo(productNo);
	}

	@Override
	public List<ImgDetailVO> selectDelete(List<Integer> list,int productNo) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("productNo", productNo);
		return imgDetailDao.selectDelete(map);
	}

	@Override
	@Transactional
	public int saveImgDetail(List<ImgDetailVO> list, List<Integer> deleteList,int productNo) {
		logger.info("list={},deleteList={}",list.size(), deleteList.size());
		int cnt=0;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", deleteList);
		map.put("productNo",productNo);
		cnt=imgDetailDao.deleteImgDetail(map);
		for(int i=0;i<list.size();i++) {
			cnt=imgDetailDao.insertImgDetail(list.get(i));
		}
		return cnt;
	}

}
