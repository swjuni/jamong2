package com.ez.jamong.bookmark.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDAOMybatis implements BookmarkDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.bookmark.";

	@Override
	public List<Map<String, Object>> bookmarkList(int userNo) {
		return sqlSession.selectList(namespace+"bookmarkList", userNo);
	}

	@Override
	public int bookmarkAdd(BookmarkVO bookmarkVo) {
		return sqlSession.insert(namespace+"bookmarkAdd", bookmarkVo);
	}

	@Override
	public int bookmarkDelete(int bookmarkNo) {
		return sqlSession.delete(namespace+"bookmarkDelete", bookmarkNo);
	}

	@Override
	public BookmarkVO bookmarkExist(BookmarkVO bookmarkVo) {
		return sqlSession.selectOne(namespace+"bookmarkExist", bookmarkVo);
	}

	
}
