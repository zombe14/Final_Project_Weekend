package com.project.weekend.board.notice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardService;
import com.project.weekend.board.qna.QnaDTO;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
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
	@Inject
	private FileService fileService;

	@Override
	public int setWrite(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int result = 0;
		// 글
		int num = noticeDAOImpl.getNum();
		boardDTO.setNum("n"+num);
		result = noticeDAOImpl.setWrite(boardDTO);

		// 첨부파일
		String realPath = session.getServletContext().getRealPath("/resources/images/board");

		for (MultipartFile f : filelist) {
			if (f.getOriginalFilename().length() > 0) {
				FileDTO fileDTO = new FileDTO();

				fileDTO.setNum("n"+num);

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
	public int setUpdate(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int result = 0;
		// 글		
		result = noticeDAOImpl.setUpdate(boardDTO);
		
		// 파일
		List<FileDTO> list = fileDAO.getList(boardDTO.getNum());
		String realPath = session.getServletContext().getRealPath("/resources/images/board");

		for (MultipartFile f : filelist) {
			if (f.getOriginalFilename().length() > 0) {
				FileDTO fileDTO = new FileDTO();

				fileDTO.setNum(boardDTO.getNum());

				String fname = fileSaver.saveFile(realPath, f);
				fileDTO.setFname(fname);
				String oname = f.getOriginalFilename();
				fileDTO.setOname(oname);
				result = fileDAO.setWrite(fileDTO);
				System.out.println(result);
			}
		}

		return result;
	}

	@Override
	public int setDelete(String num, HttpSession session) throws Exception {
		return noticeDAOImpl.setDelete(num);
	}

	@Override
	public BoardDTO getSelect(String num, HttpSession session) throws Exception {
		BoardDTO boardDTO = noticeDAOImpl.getSelect(num);
		NoticeDTO noticeDTO = (NoticeDTO)boardDTO;
		if(noticeDTO.getFileDTOs().size()==1) {
			if(noticeDTO.getFileDTOs().get(0).getFname()==null) {
				noticeDTO.setFileDTOs(new ArrayList<FileDTO>());
			}
		}
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
