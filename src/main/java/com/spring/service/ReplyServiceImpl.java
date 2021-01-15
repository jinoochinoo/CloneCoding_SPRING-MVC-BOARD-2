package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ReplyDAO;
import com.spring.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReply(replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(replyVO);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(replyVO);	
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(rno);
	}

}
