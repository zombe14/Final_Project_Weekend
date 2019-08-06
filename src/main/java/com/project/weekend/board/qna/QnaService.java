package com.project.weekend.board.qna;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class QnaService {

	@Inject
	private QnaDAO qnaDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileService fileService;

	public int setWrite(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		String num = "q" + qnaDAO.getNum();
		qnaDTO.setNum(num);
		int res = qnaDAO.setWrite(qnaDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for (MultipartFile f : filelist) {
			if (f.getOriginalFilename().length() > 0) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFname(fileSaver.saveFile(realPath, f));
				fileDTO.setNum(num);
				fileDTO.setOname(f.getOriginalFilename());
				res = fileDAO.setWrite(fileDTO);
			}
		}
		return res;
	}

	public int setUpdate(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int res = 0;
		res = qnaDAO.setUpdate(qnaDTO);

		String realPath = session.getServletContext().getRealPath("/resources/images/board");

		for (MultipartFile f : filelist) {
			if (f.getOriginalFilename().length() > 0) {
				FileDTO fileDTO = new FileDTO();

				fileDTO.setNum(qnaDTO.getNum());

				String fname = fileSaver.saveFile(realPath, f);
				fileDTO.setFname(fname);
				String oname = f.getOriginalFilename();
				fileDTO.setOname(oname);
				res = fileDAO.setWrite(fileDTO);
			}
		}

		return res;
	}

	public int setDelete(String num, HttpSession session) throws Exception {
		int res = qnaDAO.setDelete(num);
		List<FileDTO> list = fileDAO.getList(num);
		if(list != null) {
			for(FileDTO fileDTO : list) {
				res = fileService.setDelete(fileDTO, "board", session);
			}
		}
		return res;
	}

	public QnaDTO getSelect(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaDTO qnaDTO = qnaDAO.getSelect(num);
		
		//update 시 파일 없는데 X만 뜨는거 방지. 새로운 리스트로 세팅
		if(qnaDTO.getFileDTOs().size()==1) {
			if(qnaDTO.getFileDTOs().get(0).getFname()==null) {
				qnaDTO.setFileDTOs(new ArrayList<FileDTO>());
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
			qnaDAO.setHitUpdate(num);
			Cookie c = new Cookie(num, num);
			c.setMaxAge(30*60); // 30분
			response.addCookie(c);
		}
		return qnaDTO;
	}

	public List<QnaDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception {
		pageMaker.makeRow();
		List<QnaDTO> list = qnaDAO.getList(pageMaker);
		int totalCount = qnaDAO.getCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}

}
