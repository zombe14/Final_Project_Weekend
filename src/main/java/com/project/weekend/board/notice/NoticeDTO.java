package com.project.weekend.board.notice;

import java.util.ArrayList;
import java.util.List;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.file.FileDTO;


// num/title/writer/contents/reg_date/hit/List<FileDTO> + top

public class NoticeDTO extends BoardDTO {
	private int top;
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}

	
}
