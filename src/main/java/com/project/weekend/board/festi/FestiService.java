package com.project.weekend.board.festi;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
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
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getList(pageMaker);
		int totalCount = festiDAO.getCount();
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
	
	public int setUpdate(FestiDTO festiDTO) throws Exception{
		int res = festiDAO.setUpdate(festiDTO);
		return res;
	}
	
	public int setDelete(String num) throws Exception{
		return festiDAO.setDelete(num);
	}
	
	public int getNum() throws Exception{
		return festiDAO.getNum();
	}

}