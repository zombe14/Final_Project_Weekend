package com.project.weekend.adminReser;

import java.util.List;

import com.project.weekend.board.BoardDAO;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

public class aReserDAO implements BoardDAO{

	@Override
	public int setWrite(BoardDTO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(BoardDTO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(String num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO getSelect(String num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
