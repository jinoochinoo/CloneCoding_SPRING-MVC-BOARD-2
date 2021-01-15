package com.spring.dao;

import com.spring.vo.MemberVO;

public interface MemberDAO {

	public void register(MemberVO memberVO) throws Exception;

	public MemberVO login(MemberVO memberVO) throws Exception;

	public void memberUpdate(MemberVO memberVO) throws Exception;

	public void memberDelete(MemberVO memberVO) throws Exception;
	
	public int passChk(MemberVO memberVO) throws Exception;


}
