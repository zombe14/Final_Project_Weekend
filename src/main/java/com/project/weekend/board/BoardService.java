package com.project.weekend.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.util.PageMaker;

public interface BoardService {
	
	// 글쓰기
	public int setWrite(BoardDTO boardVO, List<MultipartFile> files, HttpSession session) throws Exception;
	
	// 글수정
	public int setUpdate(BoardDTO boardVO, List<MultipartFile> files, HttpSession session) throws Exception;
	
	// 글삭제
	public int setDelete(int num, HttpSession session) throws Exception;
	
	// 글선택
	public BoardDTO getSelect(int num, HttpSession session) throws Exception;
	
	// 글리스트
	public List<BoardDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception;
}

