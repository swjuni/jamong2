package com.ez.jamong.bookmark.model;

import java.util.List;
import java.util.Map;

public interface BookmarkService {
	public List<Map<String, Object>> bookmarkList(int userNo);
	public int bookmarkAdd(BookmarkVO bookmarkVo);
	public int bookmarkDelete(List<BookmarkVO> list);
}
