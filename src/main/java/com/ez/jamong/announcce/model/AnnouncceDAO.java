package com.ez.jamong.announcce.model;

import java.util.List;

import com.ez.jamong.common.SearchVO;

public interface AnnouncceDAO {
	public int announcceAdd(AnnouncceVO vo);
	public List<AnnouncceVO> selectAll();
	public int updateReadCount(int announceNo);
	public AnnouncceVO selectByNo(int announceNo);
	public int updateAnnouncce(AnnouncceVO vo);
	public int deleteAnnouncce(int announceNo);
	public List<AnnouncceVO> selectSearch(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public AnnouncceVO next(int announceNo);
	public AnnouncceVO prev(int announceNo);
}
