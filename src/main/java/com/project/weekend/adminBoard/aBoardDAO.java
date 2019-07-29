package com.project.weekend.adminBoard;

import java.util.List;

import com.project.weekend.board.BoardDAO;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

public class aBoardDAO implements BoardDAO{

	@Override
	public int setWrite(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		
		return 0;
	}

	@Override
	public int setDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO getSelect(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
