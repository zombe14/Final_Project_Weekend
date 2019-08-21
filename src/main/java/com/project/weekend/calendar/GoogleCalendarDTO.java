package com.project.weekend.calendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GoogleCalendarDTO {
	private String summary;	//행사명
	private String sdate;	//시작 날짜
	private String stime = "09:00";
	private String edate;	//종료날짜
	private String etime = "21:00";
	private String description = "";
	private String eid;	//구글캘린더에서 반환되는 값
	private String cid = "euecreof8ipii55sr38dqagcao@group.calendar.google.com";
	private String board;	//보드num

	public GoogleCalendarDTO() {}

	public Date getStartDateTime() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddHH:mm");
		return format.parse(sdate+stime);
	}
	public Date getEndDateTime() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddHH:mm");
		return format.parse(edate+etime);
	}


	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}
}
