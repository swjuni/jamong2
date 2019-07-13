package com.ez.jamong.announcce.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.jamong.common.SearchVO;

@Repository
public class AnnouncceDAOMybatis implements AnnouncceDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.announcce.";
	
	@Override
	public int announcceAdd(AnnouncceVO vo) {
		return sqlSession.insert(namespace+"announcceAdd", vo);
	}

	@Override
	public List<AnnouncceVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public int updateReadCount(int announceNo) {
		return sqlSession.update(namespace+"updateReadCount", announceNo);
	}

	@Override
	public AnnouncceVO selectByNo(int announceNo) {
		return sqlSession.selectOne(namespace+"selectByNo", announceNo);
	}

	@Override
	public int updateAnnouncce(AnnouncceVO vo) {
		return sqlSession.update(namespace+"updateAnnouncce", vo);
	}

	@Override
	public int deleteAnnouncce(int announceNo) {
		return sqlSession.delete(namespace+"deleteAnnouncce", announceNo);
	}

	@Override
	public List<AnnouncceVO> selectSearch(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectSearch", searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalCount", searchVo);
	}

	
}
