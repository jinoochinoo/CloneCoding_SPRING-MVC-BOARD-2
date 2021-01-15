package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject SqlSession sql;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("replyMapper.readReply", bno);
	}

	@Override
	public void writeReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("replyMapper.writeReply", replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		sql.update("replyMapper.updateReply", replyVO);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("replyMapper.deleteReply", replyVO);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("replyMapper.selectReply", rno);
	}
	
	

}
