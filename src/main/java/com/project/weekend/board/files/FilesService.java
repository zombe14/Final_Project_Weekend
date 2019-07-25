package com.project.weekend.board.files;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FilesService {
	
	@Inject
	private FilesDAO filesDAO;
	
	public int setWrite(FilesDTO filesDTO, List<MultipartFile> files, HttpSession session) throws Exception{
		int result = 0;
		for(int i = 0; i<files.size();i++) {
			filesDAO.setWrite(filesDTO);
		}
		return result;
	}

}
