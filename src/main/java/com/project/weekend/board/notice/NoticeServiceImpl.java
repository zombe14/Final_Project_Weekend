package com.project.weekend.board.notice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.omg.CORBA.Request;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardService;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
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
			}
		}
		return result;
	}
	@Override
	public int setDelete(String num, HttpSession session) throws Exception {
		int res = noticeDAOImpl.setDelete(num);
		List<FileDTO> list = fileDAO.getList(num);
		if(list != null) {
			for(FileDTO fileDTO : list) {
				res = fileService.setDelete(fileDTO, "board", session);
			}
		}
		return res;
	}
	@Override
	public BoardDTO getSelect(String num, HttpSession sesion) throws Exception{
		return null;
	}
	public BoardDTO getSelect(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDTO boardDTO = noticeDAOImpl.getSelect(num);
		//update 시 파일 없는데 X만 뜨는거 방지. 새로운 리스트로 세팅
		NoticeDTO noticeDTO = (NoticeDTO)boardDTO;
		if(noticeDTO.getFileDTOs().size()==1) {
			if(noticeDTO.getFileDTOs().get(0).getFname()==null) {
				noticeDTO.setFileDTOs(new ArrayList<FileDTO>());
			}
		}
		// 쿠키를 이용해서 ajax, 새로고침 시 조회수 증가 방지
		boolean isGet = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c:cookies) {
				if(c.getName().equals(num)) {
					isGet=true;
				}
			}
		}
		if(!isGet) {
			noticeDAOImpl.setHitUpdate(num);
			Cookie c = new Cookie(num, num);
			c.setMaxAge(30*60); // 30분
			response.addCookie(c);
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
	public List<BoardDTO> getNewList() throws Exception{
		return noticeDAOImpl.getNewList();
	}
}
