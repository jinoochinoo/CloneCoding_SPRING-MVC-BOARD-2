package com.spring.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.dao.BoardDAO;
import com.spring.util.FileUtils;
import com.spring.vo.BoardVO;
import com.spring.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		
		dao.write(boardVO);

		// 첨부파일 받기
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest);
		int size = list.size();
		// 첨부파일 여러 개 업로드 가능하게 설정
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
		
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		dao.boardHit(bno);
		return dao.read(bno);
	}

	@Override
	public void update(BoardVO boardVO, String[] fileNoDel, String[] fileNameDel,
			MultipartHttpServletRequest mpRequest) throws Exception {
		
		// 내용 수정
		dao.update(boardVO);
		
		// 첨부파일 수정
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, fileNoDel, fileNameDel, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(String fileNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(fileNo);
	}

}
