package com.project.weekend.board.notice;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardService;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class NoticeServiceImpl implements BoardService {
	
	@Inject
	private NoticeDAOImpl noticeDAOImpl;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;

	@Override
	public int setWrite(BoardDTO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception {
		// 글
		int result = noticeDAOImpl.setWrite(boardDTO);
		
		System.out.println(boardDTO.getContents());
		System.out.println(boardDTO.getNum());
		
		// 첨부파일
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		
		List<FileDTO> list = new ArrayList<FileDTO>();
		
		for(MultipartFile f : files) {
			if(f.getOriginalFilename().length()>0) {
				FileDTO fileDTO = new FileDTO();
				
				int num = boardDTO.getNum();
				
				System.out.println(num);
				
				fileDTO.setNum(num);
				
				String fname = fileSaver.saveFile(realPath, f);
				fileDTO.setFname(fname);
				String oname = f.getOriginalFilename();
				fileDTO.setOname(oname);
				
				list.add(fileDTO);
			}
		}
		
		if(files.size()>0) {			
			result = fileDAO.setWrite(list);
		}

		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception {
		return noticeDAOImpl.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		return noticeDAOImpl.setDelete(num);
	}

	@Override
	public BoardDTO getSelect(int num, HttpSession session) throws Exception {
		BoardDTO boardDTO = noticeDAOImpl.getSelect(num);
		
		return boardDTO;
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception {
		pageMaker.makeRow();
		List<BoardDTO> list = noticeDAOImpl.getList(pageMaker);
		int totalCount = noticeDAOImpl.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	
	public List<BoardDTO> getTopList() throws Exception{
		return noticeDAOImpl.getTopList();
	}

}
