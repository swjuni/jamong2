package com.ez.jamong.Author.model;

import java.util.List;

public interface AuthorService {
	public List<AuthorVO> selectAutorityAll(String authorDesc);
}
