package com.ez.jamong.evalComment.model;

import java.util.List;

public interface EvalCommentService {
	public int insertEvalComment(EvalCommentVO evalCommentVo);
	public int insertReply(EvalCommentVO evalCommentVo);
	public List<EvalCommentVO> selectByEvalNo(int evalNo);
	public int deleteReplyComment(int evalCNo);
}
