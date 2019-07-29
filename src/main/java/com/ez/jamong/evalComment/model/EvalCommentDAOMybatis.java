package com.ez.jamong.evalComment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EvalCommentDAOMybatis implements EvalCommentDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.evalcomment.";
	
	@Override
	public int insertEvalComment(EvalCommentVO evalCommentVo) {
		return sqlSession.insert(namespace+"insertEvalComment", evalCommentVo);
	}
	@Override
	public int insertReply(EvalCommentVO evalCommentVo) {
		return sqlSession.insert(namespace+"insertReply", evalCommentVo);
	}
	@Override
	public int updateSortNo(EvalCommentVO evalCommentVo) {
		return sqlSession.update(namespace+"updateSortNo", evalCommentVo);
	}
	@Override
	public List<EvalCommentVO> selectByEvalNo(int evalNo) {
		return sqlSession.selectList(namespace+"selectByEvalNo", evalNo);
	}
	
}
