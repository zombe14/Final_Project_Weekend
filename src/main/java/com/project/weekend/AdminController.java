package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
	@Inject
	private NoticeServiceImpl noticeServiceImpl;

	////////////// admin Main; //////////////
	// 여기에 전반적인 뭔가를 뿌려야됨;
	@RequestMapping(value = "adminMain", method = RequestMethod.GET)
	public ModelAndView adminBoard() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "관리자 메인");
		mv.setViewName("admin/adminMain");
		return mv;
	}
	////////////// admin User; //////////////
	// userList
	@RequestMapping(value = "adminUserBoard", method = RequestMethod.GET)
	public ModelAndView adminUserBoard() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/User/adminUserBoard");
		return mv;
	}
	// user info;
	@RequestMapping(value = "adminUserSelect", method = RequestMethod.GET)
	public ModelAndView adminUserSelect() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/User/adminUserSelect");
		return mv;
	}
	// user up/down grade;
	@RequestMapping(value = "adminUserUpdate")
	public ModelAndView adminUserUpdate() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/User/adminUserUpdate"); 
		return mv;
	}
	// user delete;
	@RequestMapping(value = "adminUserDelete", method = RequestMethod.GET)
	public ModelAndView adminUserDelete() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/User/adminUserDelete");
		return mv;
	}
	////////////// board 관리; //////////////
	////////////// notice board; //////////////
	@RequestMapping(value = "adminBoard", method = RequestMethod.GET) 
	public ModelAndView adminNoticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		List<BoardDTO> list = noticeServiceImpl.getList(pageMaker, session); 
		mv.addObject("board", "notice"); 
		mv.addObject("boardTitle", "관리자모드"); 
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/Board/adminBoard");
	return mv;
	}
	// notice;
	// show;
	// festival
	// after;
	// recommend;
	// rank;
	// qna;
	////////////// reservation 관리; //////////////
	@RequestMapping(value = "adminReserBoard", method = RequestMethod.GET)
	public ModelAndView adminReserList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/Reser/adminReserBoard");
		return mv;
	}
	// reservation;
	// reserList;
	// reserInfo;
	// reserUpdate;
	// reserDelete;
}
