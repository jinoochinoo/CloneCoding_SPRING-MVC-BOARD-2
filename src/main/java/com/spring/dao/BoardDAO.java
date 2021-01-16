package com.spring.dao;

import java.util.List;
import java.util.Map;

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
	
	public void insertFile(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectFileList(int bno) throws Exception;

	public Map<String, Object> selectFileInfo(String fileNo) throws Exception;

	public void updateFile(Map<String, Object> map) throws Exception;

	public void boardHit(int bno) throws Exception;
	
}
