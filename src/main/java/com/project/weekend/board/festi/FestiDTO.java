package com.project.weekend.board.festi;

import java.sql.Date;
import java.util.ArrayList;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.file.FileDTO;

// num, title, writer, contents, reg_date, hit, 
// category, price, total, startDate, endDate, local,	+ fileDTOs
// top
public class FestiDTO{
	private int category;	// 1-전시, 2-행사, 3-레저
	
	private int price;	// 가격
	private int total; // 전체좌석
	private Date startDate;	// 시작일
	private Date endDate;	// 종료일
	
	private String local;	// 지역
	private String num;
	private String title;
	private String writer;
	private String contents;
	private Date reg_date;
	private int hit;
	private int top;
	private String age;
	private String region;
	

	//------------
	private ArrayList<FileDTO> fileDTOs;
	public ArrayList<FileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(ArrayList<FileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	//------------
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
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
	
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}

}
