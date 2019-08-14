package com.project.weekend.board.festi.after;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
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
	@Inject
	private FileService fileService;
	
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
		
		List<FileDTO> list = fileDAO.getList(anum);
		
		if(list != null) {
			for(FileDTO fileDTO : list) {
				res = fileService.setDelete(fileDTO, "board", session);
			}
		}
			
		return res;
	}
	
	public int setDeleteAll(String num, HttpSession session) throws Exception{
		int res = 1;
		List<String> afterDTOs = afterDAO.getListNum(num);
		System.out.println("a Ser : "+afterDTOs.size());
		if(afterDTOs.size()>0) {
			for(String a : afterDTOs) {
				System.out.println(a);
				res = fileDAO.setDeleteAll(a);
				System.out.println(res);
			}
		}

		res = afterDAO.setDeleteAll(num);
		System.out.println(res);
		
		return res;
	}
	
	public int setUpdate(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int res = 0;
		res = afterDAO.setUpdate(afterDTO);
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
	
	public AfterDTO getSelect(String anum, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		AfterDTO afterDTO = new AfterDTO();
		afterDTO = afterDAO.getSelect(anum);
		//update 시 파일 없는데 X만 뜨는거 방지. 새로운 리스트로 세팅
		if(afterDTO.getFileDTOs().size()==1) {
			if(afterDTO.getFileDTOs().get(0).getFname()==null) {
				afterDTO.setFileDTOs(new ArrayList<FileDTO>());
			}
		}
		
		// 쿠키를 이용해서 ajax, 새로고침 시 조회수 증가 방지
		boolean isGet = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c:cookies) {
				if(c.getName().equals(anum)) {
					isGet=true;
				}
			}
		}
		if(!isGet) {
			afterDAO.setHitUpdate(anum);
			Cookie c = new Cookie(anum, anum);
			c.setMaxAge(30*60); // 30분
			response.addCookie(c);
		}
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
