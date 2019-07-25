package com.ez.jamong.report.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.jamong.common.SearchVO;

@Repository
public class ReportDAOMybatis implements ReportDAO{
	@Autowired private SqlSession session;
	private String namespace="config.mybatis.mapper.oracle.report.";
	
	@Override
	public List<Map<String, Object>> selectReported(SearchVO searchVo) {
		return session.selectList(namespace+"selectReported", searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return session.selectOne(namespace+"selectTotalCount",searchVo);
	}

	@Override
	public int acceptReport(Map<String, Integer> map) {
		return session.update(namespace+"acceptReport",map);
	}
	
	@Override
	public int refuseReport(Map<String, Integer> map) {
		return session.update(namespace+"refuseReport",map);
	}

	@Override
	public int reportAdd(ReportVO reportVo) {
		return session.insert(namespace+"reportAdd",reportVo);
	}

	@Override
	public List<ReportExtendsVO> reportListByUserNo(ReportSearchVO searchVo) {
		return session.selectList(namespace+"reportListByUserNo", searchVo);
	}
}
