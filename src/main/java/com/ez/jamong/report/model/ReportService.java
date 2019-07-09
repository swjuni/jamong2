package com.ez.jamong.report.model;

import java.util.List;
import java.util.Map;

import com.ez.jamong.common.SearchVO;

public interface ReportService {
	public List<Map<String, Object>> selectReported(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int acceptReport(List<ReportVO> list, int adminNo);
	public int refuseReport(List<ReportVO> list, int adminNo);
	public int approveOne(int reportNo, int productNo, int adminNo);
	public int refuseOne(int reportNo, int adminNo);
}
