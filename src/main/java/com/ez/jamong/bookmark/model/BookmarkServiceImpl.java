package com.ez.jamong.bookmark.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	@Autowired private BookmarkDAO bookmarkDao;

	@Override
	public List<Map<String, Object>> bookmarkList(int userNo) {
		return bookmarkDao.bookmarkList(userNo);
	}

	@Override
	public int bookmarkAdd(BookmarkVO bookmarkVo) {
		return bookmarkDao.bookmarkAdd(bookmarkVo);
	}

	@Override
	public int bookmarkDelete(int bookmarkNo) {
		return bookmarkDao.bookmarkDelete(bookmarkNo);
	}

}
