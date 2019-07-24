package com.project.weekend.board.files;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class FilesService {
	
	@Inject
	private FilesDAO filesDAO;
	
	public int setWrite(FilesDTO filesDTO) throws Exception{
		return filesDAO.setWrite(filesDTO);
	}

}
