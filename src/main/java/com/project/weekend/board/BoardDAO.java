package com.project.weekend.board;

import java.util.List;

import com.project.weekend.util.PageMaker;

public interface BoardDAO {
	
	// 글쓰기
	public int setWrite(BoardDTO boardVO) throws Exception;
	
	// 글수정
	public int setUpdate(BoardDTO boardVO) throws Exception;
	
	// 글삭제
	public int setDelete(String num) throws Exception;
	
	// 글선택
	public BoardDTO getSelect(String num) throws Exception;
	
	// 글리스트
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception;
	
}
