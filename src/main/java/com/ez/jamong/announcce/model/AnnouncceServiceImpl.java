package com.ez.jamong.announcce.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.jamong.common.SearchVO;

@Service
public class AnnouncceServiceImpl implements AnnouncceService{
	@Autowired private AnnouncceDAO announcceDao;

	@Override
	public int announcceAdd(AnnouncceVO vo) {
		return announcceDao.announcceAdd(vo);
	}

	@Override
	public List<AnnouncceVO> selectAll() {
		return announcceDao.selectAll();
	}

	@Override
	public int updateReadCount(int announceNo) {
		return announcceDao.updateReadCount(announceNo);
	}

	@Override
	public AnnouncceVO selectByNo(int announceNo) {
		return announcceDao.selectByNo(announceNo);
	}

	@Override
	public int updateAnnouncce(AnnouncceVO vo) {
		return announcceDao.updateAnnouncce(vo);
	}

	@Override
	public int deleteAnnouncce(int announceNo) {
		return announcceDao.deleteAnnouncce(announceNo);
	}

	
	@Override
	@Transactional
	public int deleteAnnouncceItems(List<AnnouncceVO> list) {
		int cnt = 0;
		
		try {
			for(AnnouncceVO vo : list) {
				if(vo.getAnnounceNo()!=0) {	//체크된 것만 삭제
					cnt = announcceDao.deleteAnnouncce(vo.getAnnounceNo());
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

	@Override
	public List<AnnouncceVO> selectSearch(SearchVO searchVo) {
		return announcceDao.selectSearch(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return announcceDao.selectTotalCount(searchVo);
	}
	
	
	

}
