package com.spring.dao;

import java.util.List;

import com.spring.vo.BoardVO;

public interface BoardDAO {
	
	public void write(BoardVO boardVO) throws Exception;

	public List<BoardVO> list() throws Exception;
	
}
