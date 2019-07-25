package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
	
	//////////////admin board; //////////////
	@RequestMapping(value = "adminBoard")
	public String adminBoard() throws Exception{
		return "./admin/adminBoard";
	}
	//////////////user 관리; //////////////
	// user list;
	public void userList() throws Exception{}
	
	// user info;
	public void userSelect() throws Exception{}
	
	// user up/down grade;
	public void userUpdate() throws Exception{}
	
	// user delete;
	public void userDelete() throws Exception{}
	
	////////////// board 관리; //////////////
	
	// notice;
	public void aNoticeList() throws Exception{}
	
	// show;
	public void aShowList() throws Exception{}
	
	// festival
	public void aFestiList() throws Exception{}
	
	// after;
	public void aAfterList() throws Exception{}

	// recommend;
	public void aRecommendList() throws Exception{}
	
	// rank;
	public void aRankList() throws Exception{}
	
	// qna;
	public void aQnaList() throws Exception{}
	
	////////////// reservation 관리; //////////////
	// reservation;
	// reserList;
	public void aReserList() throws Exception{}
	
	// reserInfo;
	public void aReserSelect() throws Exception{}
	
	// reserUpdate;
	public void aReserUpdate() throws Exception{}
	
	// reserDelete;
	public void areserDelete() throws Exception{}
	
	
}
