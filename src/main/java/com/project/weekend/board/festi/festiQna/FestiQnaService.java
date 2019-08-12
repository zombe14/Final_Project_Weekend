package com.project.weekend.board.festi.festiQna;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class FestiQnaService {
	
	@Inject
	private FestiQnaDAO festiQnaDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileService fileService;
	@Inject
	private FileSaver fileSaver;
	
	public int setWrite(FestiQnaDTO festiQnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		String qnum = "j"+festiQnaDAO.getNum();
		festiQnaDTO.setQnum(qnum);
		int res =  festiQnaDAO.setWrite(festiQnaDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for(MultipartFile f:filelist) {
			if(f.getOriginalFilename().length()>0) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(qnum);
				fileDTO.setFname(fileSaver.saveFile(realPath, f));
				fileDTO.setOname(f.getOriginalFilename());
				res = fileDAO.setWrite(fileDTO);
			}
		}
		return res;
	}
	
	public int setUpdate(FestiQnaDTO festiQnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		int res = festiQnaDAO.setUpdate(festiQnaDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for(MultipartFile f:filelist) {
			if(f.getOriginalFilename().length()>0) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(festiQnaDTO.getQnum());
				fileDTO.setFname(fileSaver.saveFile(realPath, f));
				fileDTO.setOname(f.getOriginalFilename());
				res = fileDAO.setWrite(fileDTO);
			}
		}
		return res;
	}
	
	public int setDelete(String qnum, HttpSession session) throws Exception{
		int res = festiQnaDAO.setDelete(qnum);
		
		List<FileDTO> list = fileDAO.getList(qnum);
		
		if(list != null) {
			for(FileDTO fileDTO : list) {
				res = fileService.setDelete(fileDTO, "board", session);
			}
		}
		return res;
	}
	
	public int setDeleteOrigin(String num) throws Exception{
		int res = festiQnaDAO.setDeleteOrigin(num);
		res = fileDAO.setDeleteAll(num);
		return res;
	}
	
	public int setDeleteAll(String num) throws Exception{
		int res = festiQnaDAO.setDeleteAll(num);
		res = fileDAO.setDeleteAll(num);
		return res;
	}
	
	public FestiQnaDTO getSelect(String qnum) throws Exception{
		FestiQnaDTO festiQnaDTO = festiQnaDAO.getSelect(qnum);
		return festiQnaDTO;
	}
	
	public List<FestiQnaDTO> getList(PageMaker pageMaker) throws Exception{
		
		pageMaker.makeRow();
		int totalCount = festiQnaDAO.getCount(pageMaker.getNum());
		pageMaker.makePage(totalCount);
		List<FestiQnaDTO> list = festiQnaDAO.getList(pageMaker);
		return list;
	}

}
