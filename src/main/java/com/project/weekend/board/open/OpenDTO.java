package com.project.weekend.board.open;

import java.util.ArrayList;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.file.FileDTO;

public class OpenDTO extends BoardDTO{

	private ArrayList<FileDTO> fileDTOs;

	public ArrayList<FileDTO> getFileDTOs() {
		return fileDTOs;
	}

	public void setFileDTOs(ArrayList<FileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
}
