package com.project.weekend.board.festi;

import java.sql.Date;
import java.util.ArrayList;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.file.FileDTO;

// num, title, writer, contents, reg_date, hit, 
// category, price, total, startDate, endDate, local,	+ fileDTOs
// top
public class FestiDTO extends BoardDTO{
	private int category;	// 1-축제, 2-공연
	private int price;	// 가격
	private int total; // 전체좌석
	private Date startDate;	// 시작일
	private Date endDate;	// 종료일
	private String local;	// 지역
	
	//------------
	private ArrayList<FileDTO> fileDTOs;

	public ArrayList<FileDTO> getFileList() {
		return fileDTOs;
	}

	public void setFileList(ArrayList<FileDTO> fileList) {
		this.fileDTOs = fileList;
	}
	//------------
	
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
}
