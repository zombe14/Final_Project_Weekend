package com.project.weekend.board.festi.after;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class AfterService {

	@Inject
	private AfterDAO afterDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	
	public int setWrite(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		int res = 0;
		String anum = "a"+afterDAO.getNum();
		afterDTO.setAnum(anum);
		
		// num : jsp에서 넘기면 afterDTO에 넣을 수 있는 지 아니면 파라미터로 바로 넘기는 지 확인해보기 //
		/* afterDTO.setNum(num); */
		res = afterDAO.setWrite(afterDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for(MultipartFile f : filelist) {
			if(f.getOriginalFilename().length()>0) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(anum);
				fileDTO.setOname(f.getOriginalFilename());
				fileDTO.setFname(fileSaver.saveFile(realPath, f));
				res = fileDAO.setWrite(fileDTO);				
			}
		}
			
		return res;
	}
	
	public int setDelete(String anum, HttpSession session) throws Exception{
		int res = 0;
		res = afterDAO.setDelete(anum);
		res = fileDAO.setDeleteAll(anum);
		List<FileDTO> files = fileDAO.getList(anum);
		
		// db에서 글 삭제
		res = afterDAO.setDelete(anum);
		
		// files db에서 삭제
		fileDAO.setDeleteAll(anum);

		// 이미지 디렉토리에서 파일 삭제
		String realPath=session.getServletContext().getRealPath("/resources/images/board");
		for(FileDTO f : files) {
			String fname = f.getFname();
			fileSaver.deleteFile(realPath, fname);
		} 
			
		return res;
	}
	
	public int setUpdate(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int res = 0;
		res = afterDAO.setUpdate(afterDTO);
		res = fileDAO.setDeleteAll(afterDTO.getAnum());
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		String num = afterDTO.getAnum();
		for(MultipartFile f : filelist) {
			FileDTO fileDTO = new FileDTO();
			fileDTO.setNum(num);
			fileDTO.setOname(f.getOriginalFilename());
			fileDTO.setFname(fileSaver.saveFile(realPath, f));
			res = fileDAO.setWrite(fileDTO);
		}
		return res;
	}
	
	public AfterDTO getSelect(String anum, HttpSession session) throws Exception{
		AfterDTO afterDTO = new AfterDTO();
		afterDTO = afterDAO.getSelect(anum);
		return afterDTO;
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////
	
	public List<AfterDTO> getList(PageMaker pageMaker, String num) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagerMaker", pageMaker);
		map.put("num", num);
		
		int totalCount = afterDAO.getCount(map);

		pageMaker.makeRow();
		pageMaker.makePage(totalCount);	
		
		List<AfterDTO> list = afterDAO.getList(map);
				
		return list;
	}
	
}
