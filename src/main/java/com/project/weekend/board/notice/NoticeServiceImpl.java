package com.project.weekend.board.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardService;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

@Service
public class NoticeServiceImpl implements BoardService {
	
	@Inject
	private NoticeDAOImpl noticeDAOImpl;

	@Override
	public int setWrite(BoardDTO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception {
		return noticeDAOImpl.setWrite(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception {
		boardDTO = noticeDAOImpl.getSelect(boardDTO.getNum());
		return noticeDAOImpl.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		return noticeDAOImpl.setDelete(num);
	}

	@Override
	public BoardDTO getSelect(int num, HttpSession session) throws Exception {
		return noticeDAOImpl.getSelect(num);
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception {
		int totalCount = noticeDAOImpl.getTotalCount();
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<BoardDTO> lists = noticeDAOImpl.getList(pageMaker);
		return lists;
	}

}