package com.project.weekend.board.festi.after;

import java.sql.Date;
import java.util.ArrayList;

import com.project.weekend.file.FileDTO;

public class AfterDTO {

	private String anum;
	private String num;
	private String writer;
	private String title;
	private String contents;
	private Date reg_date;
	private int hit;
	private int point;
	private int ref;
	private int step;
	private int depth;
	private ArrayList<FileDTO> fileDTOs;
	private Double avg;
	public Double getAvg() {
		return avg;
	}
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	public String getAnum() {
		return anum;
	}
	public void setAnum(String anum) {
		this.anum = anum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}

	public ArrayList<FileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(ArrayList<FileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
}
