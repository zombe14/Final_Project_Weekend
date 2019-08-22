package com.project.weekend.board.open;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.BoardService;
import com.project.weekend.board.open.OpenDAO;
import com.project.weekend.board.open.OpenDTO;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

public class OpenService implements BoardService {
	
	@Inject
	private OpenDAO openDAO;
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
		int num = openDAO.getNum();
		boardDTO.setNum("n"+num);
		result = openDAO.setWrite(boardDTO);

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
		result = openDAO.setUpdate(boardDTO);
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
		int res = openDAO.setDelete(num);
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
		BoardDTO boardDTO = openDAO.getSelect(num);
		//update 시 파일 없는데 X만 뜨는거 방지. 새로운 리스트로 세팅
		OpenDTO openDTO = (OpenDTO)boardDTO;
		if(openDTO.getFileDTOs().size()==1) {
			if(openDTO.getFileDTOs().get(0).getFname()==null) {
				openDTO.setFileDTOs(new ArrayList<FileDTO>());
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
			openDAO.setHitUpdate(num);
			Cookie c = new Cookie(num, num);
			c.setMaxAge(30*60); // 30분
			response.addCookie(c);
		}
		return boardDTO;
	}
	@Override
	public List<BoardDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception {
		pageMaker.makeRow();
		List<BoardDTO> list = openDAO.getList(pageMaker);
		int totalCount = openDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	public List<BoardDTO> getTopList() throws Exception {
		return openDAO.getTopList();
	}
	public List<BoardDTO> getNewList() throws Exception{
		return openDAO.getNewList();
	}

}
