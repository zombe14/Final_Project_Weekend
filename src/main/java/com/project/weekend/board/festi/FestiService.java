package com.project.weekend.board.festi;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.festi.after.AfterDAO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.board.festi.festiQna.FestiQnaDAO;
import com.project.weekend.board.festi.festiQna.FestiQnaService;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class FestiService {
	
	@Inject
	private FestiDAO festiDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileService fileService;
	@Inject
	private AfterDAO afterDAO;
	@Inject
	private FestiQnaDAO festiQnaDAO;
	@Inject
	private AfterService afterService;
	@Inject
	private FestiQnaService festiQnaService;

	public int setWrite(FestiDTO festiDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int num = festiDAO.getNum();
		festiDTO.setNum("f"+num);
		int res = festiDAO.setWrite(festiDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for(MultipartFile f : filelist) {
			if(f.getOriginalFilename().length()>0) {				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum("f"+num);
				fileDTO.setOname(f.getOriginalFilename());
				String fname = fileSaver.saveFile(realPath, f);
				fileDTO.setFname(fname);
				res = fileDAO.setWrite(fileDTO);
			}
		}
		return res;
	}
	public List<FestiDTO> getList(PageMaker pageMaker) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getList(pageMaker);
		pageMaker.makePage(totalCount);
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
		return list;
	}
	public FestiDTO getSelect(String num) throws Exception{
		FestiDTO festiDTO = festiDAO.getSelect(num);
		ArrayList<FileDTO> fileDTOs = (ArrayList<FileDTO>)fileDAO.getList(num);
		festiDTO.setFileDTOs(fileDTOs);
		return festiDTO;
	}
	public int setUpdate(FestiDTO festiDTO, HttpSession session) throws Exception{
		int res = festiDAO.setUpdate(festiDTO);
		return res;
	}
	public int setDelete(String num, HttpSession session) throws Exception{
		int res = 0;
		res = festiDAO.setDelete(num);
		res = afterService.setDeleteAll(num, session);
		//res = festiQnaService.setDeleteOrigin(num);
		List<FileDTO> list = fileDAO.getList(num);
		if(list != null) {
			for(FileDTO fileDTO : list) {
				res = fileService.setDelete(fileDTO, "board", session);
			}
		}
		return res;
	}
	public int getNum() throws Exception{
		return festiDAO.getNum();
	}
	// 상혁
	// 관리자 모드;
	public List<FestiDTO> getAllList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getAllList(pageMaker);
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makePage(totalCount);
		return list;
	}
	// 내글 불러오기
	public List<FestiDTO> getListMy(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getListMy(pageMaker);
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makePage(totalCount);
		return list;
	}
	// w 추천;
	// 리스트;
	public List<FestiDTO> getWeekRecoList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getWeekRecoList(pageMaker);
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makePage(totalCount);
		return list;
	}
	// 글선택;
	public FestiDTO getWeekRecoSelect(String num) throws Exception{
		FestiDTO festiDTO = festiDAO.getWeekRecoSelect(num);
		return festiDTO;
	}
	// 글쓰기;
	public int setWeekRecoWrite(FestiDTO festiDTO) throws Exception{
		int result = 0;
		result = festiDAO.setWeekRecoWrite(festiDTO);
		return result;
	} 
	// 글수정;
	public int setWeekRecoUpdate(FestiDTO festiDTO) throws Exception{
		int result = 0;
		result = festiDAO.setWeekRecoUpdate(festiDTO);
		return result;
	}
	// 글삭제;
	public int setWeekRecoDelete(String num) throws Exception{
		int result = 0;
		result = festiDAO.setWeekRecoDelete(num);
		return result;
	}
	// 유저 추천;
	// 리스트;
	public List<FestiDTO> getUserRecoList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getUserRecoList(pageMaker);
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makePage(totalCount);
		return list;
	}
	// 글선택;
	public FestiDTO getUserRecoSelect(String num) throws Exception{
		FestiDTO festiDTO = festiDAO.getSelect(num);
		return festiDTO;
	}
	// 글쓰기;
	public int setUserRecoWrite(FestiDTO festiDTO) throws Exception{
		int result = 0;
		int num = festiDAO.getNum();
		festiDTO.setNum("f"+num);
		result  = festiDAO.setUserRecoWrite(festiDTO);
		return result;
	}
	// 글수정;
	public int setUserRecoUpdate(FestiDTO festiDTO) throws Exception{
		int result = 0;
		result = festiDAO.setUserRecoUpdate(festiDTO);
		return result;
	}
	// 글삭제;
	public int setUserRecoDelete(String num) throws Exception{
		int result = 0;
		result = festiDAO.setUserRecoDelete(num);
		return result;
	}
	// 랭크;
	// 리스트;
	public List<FestiDTO> getRankList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getRankList(pageMaker);
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makePage(totalCount);
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
		return list;
	}
}