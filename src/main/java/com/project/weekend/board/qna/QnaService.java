package com.project.weekend.board.qna;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
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

		// db에서 지우기
		if (fileDAO.getList(qnaDTO.getNum()).size() > 0) {
			res = fileDAO.setDeleteAll(qnaDTO.getNum());
		}

		// 실제 디렉토리에서 지우기
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		if (qnaDAO.getSelect(qnaDTO.getNum()).getFileDTOs().size() > 0) {
			for (int i = 0; i < qnaDAO.getSelect(qnaDTO.getNum()).getFileDTOs().size(); i++) {
				int fnum = qnaDAO.getSelect(qnaDTO.getNum()).getFileDTOs().get(i).getFnum();
				String fname = fileDAO.getSelect(fnum).getFname();
				res = fileSaver.deleteFile(realPath, fname);
			}
		}

		// 파일 다시 넣기
		for (MultipartFile f : filelist) {
			if (f.getOriginalFilename().length() > 0) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFname(fileSaver.saveFile(realPath, f));
				fileDTO.setNum(qnaDTO.getNum());
				fileDTO.setOname(f.getOriginalFilename());
				res = fileDAO.setWrite(fileDTO);
			}
		}

		return res;
	}

	public int setDelete(String num, HttpSession session) throws Exception {
		int res = 0;
		/* 파일 */
		// 실제 디렉토리에서 지우기
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		if (qnaDAO.getSelect(num).getFileDTOs().size() > 0) {
			for (int i = 0; i < qnaDAO.getSelect(num).getFileDTOs().size(); i++) {
				int fnum = qnaDAO.getSelect(num).getFileDTOs().get(i).getFnum();
				String fname = fileDAO.getSelect(fnum).getFname();
				res = fileSaver.deleteFile(realPath, fname);
				System.out.println(i + 1 + " : " + res);
			}
		} // db에서 지우기
		res = fileDAO.setDeleteAll(num);
		System.out.println("0 : " + res);

		// 글 지우기
		res = qnaDAO.setDelete(num);
		return res;
	}

	public QnaDTO getSelect(String num, HttpSession session) throws Exception {
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO = qnaDAO.getSelect(num);
		return qnaDTO;
	}

	public List<QnaDTO> getList(PageMaker pageMaker, HttpSession session) throws Exception {
		int totalCount = qnaDAO.getCount(pageMaker);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		list = qnaDAO.getList(pageMaker);
		return list;
	}

}
