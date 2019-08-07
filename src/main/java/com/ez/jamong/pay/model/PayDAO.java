package com.ez.jamong.pay.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.DateSearchVO;

public interface PayDAO {
	public List<Map<String, Object>> selectByUserNo(DateSearchVO dateSearchVo);
	public int selectTotalRecord(DateSearchVO dateSearchVo);
	public Map<String, Object> selectTopSellUser();
}
