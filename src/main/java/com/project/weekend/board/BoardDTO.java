package com.project.weekend.board;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.project.weekend.file.FileDTO;

public class BoardDTO {
	private int num;
	private String title;
	private String writer;
	private String contents;
	private Date reg_date;
	private int hit;
	
	// 추가 테스트
	
	private List<FileDTO> fileDTOs;
	public List<FileDTO> getFiles() {
		return fileDTOs;
	}
	public void setFiles(List<FileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}

	
	private int top;
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	
	//	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

}
