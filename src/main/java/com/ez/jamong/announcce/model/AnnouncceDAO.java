package com.ez.jamong.announcce.model;

import java.util.List;

public interface AnnouncceDAO {
	public int announcceAdd(AnnouncceVO vo);
	public List<AnnouncceVO> selectAll();
	public int updateReadCount(int announceNo);
	public AnnouncceVO selectByNo(int announceNo);
	public int updateAnnouncce(AnnouncceVO vo);
	public int deleteAnnouncce(int announceNo);
}
