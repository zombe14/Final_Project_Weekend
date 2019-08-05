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
		System.out.println("ser 1 : "+res);
		System.out.println(anum);
		res = afterDAO.setDelete(anum);
		System.out.println("ser 2 : "+res);
		res = fileDAO.setDeleteAll(anum);
		System.out.println("ser 3 : "+res);
		List<FileDTO> files = fileDAO.getList(anum);
		
		// db에서 글 삭제
		res = afterDAO.setDelete(anum);
		System.out.println("ser 4 : "+res);
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
	
	public AfterDTO getSelect(String num, HttpSession session) throws Exception{
		AfterDTO afterDTO = new AfterDTO();
		afterDTO = afterDAO.getSelect(num);
		return afterDTO;
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////
	
	public List<AfterDTO> getList(PageMaker pageMaker) throws Exception{
		
		/*
		 * Map<String, Object> map = new HashMap<String, Object>();
		 * map.put("pagerMaker", pageMaker); map.put("num", num);
		 * System.out.println("ser list pm kind   : "+ pageMaker.getKind());
		 * System.out.println("ser list pm search : "+ pageMaker.getSearch());
		 * 
		 * System.out.println("ser list map : "+map.size());
		 */
		int totalCount = afterDAO.getCount(pageMaker);
		
	
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);	
		
		List<AfterDTO> list = afterDAO.getList(pageMaker);
		
				
		return list;
	}
	
	public List<AfterDTO> getAllList(PageMaker pageMaker) throws Exception{
		int totalCount = afterDAO.getCountAll(pageMaker);
		
		
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);	
		
		List<AfterDTO> list = afterDAO.getAllList(pageMaker);
		
		return list;
	}
	
}
