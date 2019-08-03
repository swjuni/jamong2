package com.ez.jamong.pay.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.jamong.common.DateSearchVO;

@Service
public class PayServiceImpl implements PayService{
	@Autowired private PayDAO payDao;

	@Override
	public List<Map<String, Object>> selectByUserNo(DateSearchVO dateSearchVo) {
		return payDao.selectByUserNo(dateSearchVo);
	}

	@Override
	public int selectTotalRecord(DateSearchVO dateSearchVo) {
		return payDao.selectTotalRecord(dateSearchVo);
	}
}
