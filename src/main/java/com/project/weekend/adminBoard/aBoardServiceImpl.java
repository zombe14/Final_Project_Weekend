package com.project.weekend.adminBoard;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.BoardService;
import com.project.weekend.board.notice.NoticeDAOImpl;
import com.project.weekend.file.FileDAO;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

public class aBoardServiceImpl implements BoardService{
	private NoticeDAOImpl noticeDAOImpl;
	private FileDAO fileDAO;
	private FileSaver fileSaver;
	
	//Notice board
	@Override
	public int setWrite(BoardDTO boardVO, List<MultipartFile> files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int setUpdate(BoardDTO boardVO, List<MultipartFile> files, HttpSession session) throws Exception {
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
