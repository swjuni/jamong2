package com.ez.jamong.report.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.common.SearchVO;
import com.ez.jamong.menuInfo.model.MenuInfoDAO;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired private ReportDAO reportDao;
	@Autowired private MenuInfoDAO menuInfoDao;
	@Override
	public List<Map<String, Object>> selectReported(SearchVO searchVo) {
		return reportDao.selectReported(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return reportDao.selectTotalCount(searchVo);
	}

	@Override
	@Transactional
	public int acceptReport(List<ReportVO> list, int adminNo) {
		int cnt = 0;
		
		try {
			for(ReportVO vo : list) {
				if(vo.getReportNo()!=0) {
					Map<String, Integer> map=new HashMap<String, Integer>();
					map.put("reportNo", vo.getReportNo());
					map.put("adminNo", adminNo);
					cnt = reportDao.acceptReport(map);  //신고 승인처리
					cnt = menuInfoDao.suspendedByPdNo(vo.getProductNo()); //신고상품 정지처리
					
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int refuseReport(List<ReportVO> list, int adminNo) {
		int cnt = 0;
		
		try {
			for(ReportVO vo : list) {
				if(vo.getReportNo()!=0) {
					Map<String, Integer> map=new HashMap<String, Integer>();
					map.put("reportNo", vo.getReportNo());
					map.put("adminNo", adminNo);
					cnt = reportDao.refuseReport(map);  //신고 거부 처리
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int approveOne(int reportNo, int productNo,int adminNo) {
		int cnt=0;
		try{
			Map<String, Integer> map=new HashMap<String, Integer>();
			map.put("productNo", productNo);
			map.put("adminNo", adminNo);
			cnt=reportDao.acceptReport(map);
			cnt=menuInfoDao.suspendedByPdNo(productNo);
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}

	@Override
	public int refuseOne(int reportNo, int adminNo) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("reportNo", reportNo);
		map.put("adminNo", adminNo);
		return reportDao.refuseReport(map);
	}

	@Override
	public int reportAdd(ReportVO reportVo) {
		return reportDao.reportAdd(reportVo);
	}

	@Override
	public List<ReportExtendsVO> reportListByUserNo(ReportSearchVO searchVo) {
		return reportDao.reportListByUserNo(searchVo);
	}
}
