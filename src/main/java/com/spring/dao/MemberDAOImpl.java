package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sql;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("memberMapper.register", memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("memberMapper.login", memberVO);
	}

	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		sql.update("memberMapper.memberUpdate", memberVO);
	}

	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("memberMapper.memberDelete", memberVO);
	}

	@Override
	public int passChk(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("memberMapper.passChk", memberVO);	
	}
}
