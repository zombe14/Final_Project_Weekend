package com.project.weekend.adminUser;

import java.util.List;

import com.project.weekend.board.BoardDAO;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

public class aUserDAO implements BoardDAO{
	// 유저 리스트 출력;
	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	// 유저 등록;
	@Override
	public int setWrite(BoardDTO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	// 유저 권한 조정;
	@Override
	public int setUpdate(BoardDTO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	// 유저 정보 확인;
	@Override
	public BoardDTO getSelect(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	// 유저 삭제;
	@Override
	public int setDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
