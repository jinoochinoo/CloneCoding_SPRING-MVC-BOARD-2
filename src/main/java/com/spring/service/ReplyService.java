package com.spring.service;

import java.util.List;

import com.spring.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> readReply(int bno) throws Exception;

	public void writeReply(ReplyVO replyVO) throws Exception; 
	
	public void updateReply(ReplyVO replyVO) throws Exception;
	
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;

}
