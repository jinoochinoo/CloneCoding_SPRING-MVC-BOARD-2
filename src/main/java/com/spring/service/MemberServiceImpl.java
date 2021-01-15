package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		dao.register(memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(memberVO);
	}

	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		dao.memberUpdate(memberVO);
	}

	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		dao.memberDelete(memberVO);
	}

	@Override
	public int passChk(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.passChk(memberVO);
	}

}
