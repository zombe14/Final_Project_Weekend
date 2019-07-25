package com.project.weekend;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
	@Inject
	private NoticeServiceImpl noticeServiceImpl;
	//////////////admin board; //////////////
	@RequestMapping(value = "adminBoard")
	public String adminBoard() throws Exception{
		return "./admin/adminBoard";
	}
	@RequestMapping(value = "adminUserBoard")
	public String adminUserBoard() throws Exception{
		return "./admin/adminUserBoard";
	}
	@RequestMapping(value = "adminReserBoard")
	public String adminReserBoard()throws Exception{
		return "./admin/adminReserBoard";
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
	@RequestMapping(value = "adminNoticeList", method = RequestMethod.GET)
	public ModelAndView aNoticeList(int num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeServiceImpl.getSelect(num, session);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", "adminNotice");
		mv.setViewName("리얼 경로를 입력해라");
		return mv;
	}
	
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
