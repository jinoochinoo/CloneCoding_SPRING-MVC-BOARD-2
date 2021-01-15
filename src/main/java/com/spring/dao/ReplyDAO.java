package com.spring.dao;

import java.util.List;

import com.spring.vo.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> readReply(int bno) throws Exception;

	// 댓글 작성
	public void writeReply(ReplyVO replyVO) throws Exception;

	public void updateReply(ReplyVO replyVO) throws Exception;
	
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;


}
