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
	public int bookmarkDelete(List<BookmarkVO> list) {
		int cnt = 0;
		
		try {
			for(BookmarkVO vo : list) {
				if(vo.getBookmarkNo()!=0) {	//체크된 것만 삭제
					cnt = bookmarkDao.bookmarkDelete(vo.getBookmarkNo());
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

}
