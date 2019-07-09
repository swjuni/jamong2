package com.ez.jamong.report.model;

import java.util.List;

public class ReportListVO {
	private List<ReportVO> reportCol;

	public List<ReportVO> getReportCol() {
		return reportCol;
	}

	public void setReportCol(List<ReportVO> reportCol) {
		this.reportCol = reportCol;
	}

	@Override
	public String toString() {
		return "ReportListVO [reportCol=" + reportCol + "]";
	}
	
}
