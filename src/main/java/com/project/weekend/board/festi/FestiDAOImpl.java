package com.project.weekend.board.festi;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.board.BoardDAO;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

@Repository
public class FestiDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession SqlSession;
	private static final String NAMESPACE = "FestiMapper.";

	@Override
	public int setWrite(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.insert(NAMESPACE+"setWrite", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
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
