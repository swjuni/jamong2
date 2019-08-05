package com.ez.jamong.Author.model;

import java.util.List;

public interface AuthorDAO {
	public List<AuthorVO> selectAutorityAll(String authorDesc);
	public int updateAutorityAdmin(AuthorVO vo);
	public int gradeInsert(AuthorVO vo);
	public int gradeDelete(String name);
	public List<AuthorVO> selectAuthorityList();
	public List<String> selectAuthorName();
}
