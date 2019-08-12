package com.project.weekend.board.commu;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.util.FileSaver;

@Service
public class CommuService {

	@Inject
	private CommuDAO commuDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileService fileService;
	@Inject
	private FileSaver fileSaver;
	
	public int setCommuWrite(CommuDTO commuDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		String num = Integer.toString(commuDAO.getNum());
		commuDTO.setNum(num);
		int res = commuDAO.setWrite(commuDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for(MultipartFile f : filelist) {
			FileDTO fileDTO = new FileDTO();
			fileDTO.setNum(num);
			fileDTO.setFname(fileSaver.saveFile(realPath,f));
			fileDTO.setOname(f.getOriginalFilename());
			res = fileDAO.setWrite(fileDTO);
		}
		return res;
	}
	
	public int setCommuUpdate(CommuDTO commuDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		int res = 0;
		res = commuDAO.setUpdate(commuDTO);

		return res;
	}
	
	public int setDelete(int num) throws Exception{
		int res=commuDAO.setDelete(num);
		return res;
	}
}