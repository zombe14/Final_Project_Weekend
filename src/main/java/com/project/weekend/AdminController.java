package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
	@Inject
	private NoticeServiceImpl noticeServiceImpl;
	@Inject
	private MemberService memberService;

	////////////// admin Main; //////////////
	// 여기에 전반적인 뭔가를 뿌려야됨;
	@RequestMapping(value = "adminMain", method = RequestMethod.GET)
	public ModelAndView adminBoard() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "adminMain");
		mv.setViewName("admin/adminMain");
		return mv;
	}
	////////////// admin User; //////////////
	// userList(완성)
	@RequestMapping(value = "aUserList", method = RequestMethod.GET)
	public ModelAndView aUserList(PageMaker pageMaker, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> list = memberService.getList(session, pageMaker);
		mv.addObject("board", "User");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/User/aUserList");
		return mv;
	}
	// user up grade;
	@RequestMapping(value = "aUserUpdateP", method = RequestMethod.GET)
	public String adminUserUpdateP(int grade) throws Exception{
		System.out.println("Plus controller 실행됨");
		memberService.setUpdateP(grade);
		return "redirect:./aUserList";
	}
	// user delete;
	@RequestMapping(value = "aUserDelete", method = RequestMethod.GET)
	public String adminUserDelete(String id) throws Exception{
		System.out.println("컨트롤러 온");
		memberService.setDelete(id);
		return "redirect:./aUserList";
	}
	////////////// board 관리; //////////////
	////////////// notice board; //////////////
	@RequestMapping(value = "aBoardNoticeList", method = RequestMethod.GET) 
	public ModelAndView adminNoticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		List<BoardDTO> list = noticeServiceImpl.getList(pageMaker, session); 
		mv.addObject("board", "Notice"); 
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/Board/aBoardList");
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
		mv.addObject("board", "Reser");
		mv.setViewName("admin/Reser/adminReserBoard");
		return mv;
	}
	// reservation;
	// reserList;
	// reserInfo;
	// reserUpdate;
	// reserDelete;
}
