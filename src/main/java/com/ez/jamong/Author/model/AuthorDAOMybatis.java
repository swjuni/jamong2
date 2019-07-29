package com.ez.jamong.Author.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthorDAOMybatis implements AuthorDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.author.";
	
	public List<AuthorVO> selectAutorityAll(String authorDesc) {
		List<AuthorVO> list
			=sqlSession.selectList(namespace+"selectAutorityAll",authorDesc);
		return list;
		
	}

	@Override
	public int updateAutorityAdmin(AuthorVO vo) {
		int cnt = sqlSession.update(namespace+"updateAutorityAdmin",vo);
		return cnt;
	}

	@Override
	public int gradeInsert(AuthorVO vo) {
		int cnt = sqlSession.insert(namespace+"gradeInsert",vo);
		return cnt;
	}

	@Override
	public int gradeDelete(String name) {
		int cnt = sqlSession.delete(namespace+"gradeDelete",name);
		return cnt;
	}

	@Override
	public List<Integer> selectAuthorityList() {
		return sqlSession.selectList(namespace+"selectAuthorityList");
	}
	
	
}
