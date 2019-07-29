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

import oracle.net.aso.b;

@Service
public class NoticeServiceImpl implements BoardService {

	@Inject
	private NoticeDAOImpl noticeDAOImpl;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;

	@Override
	public int setWrite(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int result = 0;
		// 글
		int num = noticeDAOImpl.getNum();
		boardDTO.setNum(num);
		result = noticeDAOImpl.setWrite(boardDTO);

		// 첨부파일
		String realPath = session.getServletContext().getRealPath("/resources/images/board");

		for (MultipartFile f : filelist) {
			if (f.getOriginalFilename().length() > 0) {
				FileDTO fileDTO = new FileDTO();

				fileDTO.setNum(num);

				String fname = fileSaver.saveFile(realPath, f);
				fileDTO.setFname(fname);
				String oname = f.getOriginalFilename();
				fileDTO.setOname(oname);
				result = fileDAO.setWrite(fileDTO);
			}
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
		/*
		// null 들어가서 업데이트할때 'X'표시 계속 뜨는거 해결
		NoticeDTO noticeDTO = (NoticeDTO)boardDTO;
		if(noticeDTO.getFiles().size() == 1) {
			if(noticeDTO.getFiles().get(0).getFname()==null) {
				noticeDTO.setFiles(new ArrayList<FileDTO>());
			}
		}
		*/
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

	public List<BoardDTO> getTopList() throws Exception {
		return noticeDAOImpl.getTopList();
	}

}
