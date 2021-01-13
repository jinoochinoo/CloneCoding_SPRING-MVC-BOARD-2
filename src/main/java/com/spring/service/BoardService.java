package com.spring.service;

import java.util.List;

import com.spring.vo.BoardVO;

public interface BoardService {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;

	public List<BoardVO> list() throws Exception;
}
