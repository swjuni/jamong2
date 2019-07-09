package com.ez.jamong.Author.model;

import java.util.List;

public interface AuthorDAO {
	public List<AuthorVO> selectAutorityAll(String authorDesc);
}
