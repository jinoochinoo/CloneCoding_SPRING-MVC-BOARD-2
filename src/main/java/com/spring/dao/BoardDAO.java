package com.spring.dao;

import java.util.List;

import com.spring.vo.BoardVO;
import com.spring.vo.SearchCriteria;

public interface BoardDAO {
	
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
	
	public void delete(int bno) throws Exception;
	
}
