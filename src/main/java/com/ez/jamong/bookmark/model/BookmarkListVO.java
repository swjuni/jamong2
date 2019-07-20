package com.ez.jamong.bookmark.model;

import java.util.List;

public class BookmarkListVO {
	private List<BookmarkVO> bookmarkItems;

	public List<BookmarkVO> getBookmarkItems() {
		return bookmarkItems;
	}

	public void setBookmarkItems(List<BookmarkVO> bookmarkItems) {
		this.bookmarkItems = bookmarkItems;
	}

	@Override
	public String toString() {
		return "BookmarkListVO [bookmarkItems=" + bookmarkItems + "]";
	}
	
	
}
