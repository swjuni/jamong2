package com.ez.jamong.report.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.SearchVO;

public interface ReportDAO {
	public List<Map<String, Object>> selectReported(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int acceptReport(Map<String, Integer> map);
	public int refuseReport(Map<String, Integer> map);
	public int reportAdd(ReportVO reportVo);
	public List<ReportExtendsVO> reportListByUserNo(ReportSearchVO searchVo);
	public int selectTotalCountByUserNo(ReportSearchVO searchVo);
}
