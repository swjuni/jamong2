package com.ez.jamong.evalComment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EvalCommentServiceImpl implements EvalCommentService{
	@Autowired private EvalCommentDAO evalCommentDao;

	@Override
	public int insertEvalComment(EvalCommentVO evalCommentVo) {
		return evalCommentDao.insertEvalComment(evalCommentVo);
	}

	@Override
	@Transactional
	public int insertReply(EvalCommentVO evalCommentVo) {
		int cnt = evalCommentDao.updateSortNo(evalCommentVo);
		cnt = evalCommentDao.insertReply(evalCommentVo);
		return cnt;
	}

	@Override
	public List<EvalCommentVO> selectByEvalNo(int evalNo) {
		return evalCommentDao.selectByEvalNo(evalNo);
	}
	
}
