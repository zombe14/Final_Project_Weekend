package com.project.weekend.board.festi;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.BoardService;
import com.project.weekend.util.PageMaker;

@Service
public class FestiServiceImpl implements BoardService {
	
	@Inject
	private FestiDAOImpl festiDAOImpl;

	@Override
	public int setWrite(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int res = festiDAOImpl.setWrite(boardDTO);
		return 0;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO getSelect(int num, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
