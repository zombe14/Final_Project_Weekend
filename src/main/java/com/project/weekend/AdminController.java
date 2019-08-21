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
import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.board.notice.NoticeServiceImpl;
import com.project.weekend.board.qna.QnaDTO;
import com.project.weekend.board.qna.QnaService;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
	@Inject
	private MemberService memberService;
	@Inject
	private NoticeServiceImpl noticeServiceImpl;
	@Inject
	private AfterService afterService;
	@Inject
	private QnaService qnaService;
	@Inject
	private FestiService festiService;
	//----------------------------------- admin Main; -----------------------------------//
	// 관리자페이지 메인(완성)
	@RequestMapping(value = "adminMain", method = RequestMethod.GET)
	public ModelAndView adminBoard(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("title", "관리자 메인");
		mv.addObject("board", "adminMain");
		mv.addObject("id", id);
		mv.setViewName("admin/adminMain");
		return mv;
	}
	//----------------------------------- admin User; -----------------------------------//
	// userList(완성)
	@RequestMapping(value = "aUserList", method = RequestMethod.GET)
	public ModelAndView aUserList(PageMaker pageMaker, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> list = memberService.getList(session, pageMaker);
		mv.addObject("title", "유저");
		mv.addObject("board", "User");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// user up grade;(완성)
	@RequestMapping(value = "aUserUpdateP", method = RequestMethod.POST)
	public ModelAndView adminUserUpdateP(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setUpdateP(id);
		mv.addObject("board", "User");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// user down grade;(완성)
	@RequestMapping(value = "aUserUpdateM", method = RequestMethod.POST)
	public ModelAndView adminUserUpdateM(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setUpdateM(id);
		mv.addObject("board", "User");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// user delete;(완성)
	@RequestMapping(value = "aUserDelete", method = RequestMethod.POST)
	public ModelAndView adminUserDelete(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setDelete(id);
		mv.addObject("board", "User");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	//----------------------------------- board 관리; -----------------------------------//
	// 종류별 게시글 가져오기;
	//////////////notice table; //////////////
	// 공지사항 리스트(완성)
	@RequestMapping(value = "aNoticeList", method = RequestMethod.GET) 
	public ModelAndView adminNoticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		List<BoardDTO> list = noticeServiceImpl.getList(pageMaker, session);
		mv.addObject("title", "공지사항");
		mv.addObject("board", "Notice"); 
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
	return mv;
	}
	// notice Delete(완성)
	@RequestMapping(value = "aNoticeDelete", method = RequestMethod.POST)
	public ModelAndView adminNoticeDelete(HttpSession session, String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeServiceImpl.setDelete(num, session);
		mv.addObject("board", "Notice");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// w추천, 유저추천, 공연, 축제, 대학로;
	//////////////festi table; //////////////
	// w 추천 리스트;
	@RequestMapping(value = "aWeekRecoList", method = RequestMethod.GET)
	public ModelAndView adminWeekRecoList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getWeekRecoList(pageMaker, session);
		mv.addObject("title", "w 추천");
		mv.addObject("board", "WeekReco");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// w 추천 삭제;
	public ModelAndView adminWeekRecoDelete(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = festiService.setDelete(num, session);
		mv.addObject("board", "WeekReco");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	//////////////QnA table; //////////////
	// QnaList(완성)
	@RequestMapping(value = "aQnaList", method = RequestMethod.GET)
	public ModelAndView adminQnaList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaDTO> list = qnaService.getList(pageMaker, session);
		mv.addObject("title", "QnA");
		mv.addObject("board", "Qna");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// QnaDelete(완성)
	@RequestMapping(value = "aQnaDelete", method = RequestMethod.POST)
	public ModelAndView adminQnaDelete(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		qnaService.setDelete(num, session);
		mv.addObject("board", "Qna");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	//////////////after board; //////////////
	// 페스티벌 후기;
	@RequestMapping(value = "aFestiAfterList", method = RequestMethod.GET)
	public ModelAndView adminFestiAfterList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AfterDTO> list = afterService.getAfterList();
		mv.addObject("title", "페스티벌 후기");
		mv.addObject("board", "FestiAfter");
		mv.addObject("list", list);
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// 공연 후기;
	@RequestMapping(value = "aShowAfterList", method = RequestMethod.GET)
	public ModelAndView adminShowAfterList(String num, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AfterDTO> list = afterService.getAllList(pageMaker);
		mv.addObject("title", "공연 후기");
		mv.addObject("board", "ShowAfter");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	//----------------------------------- Enjoy 관리 -----------------------------------//
	// show;
	public ModelAndView adminShowList() throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	// festival
	public ModelAndView adminFestiList() throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	// 공연/축제 삭제;(완성)
	@RequestMapping(value = "aEnjoyDelete", method = RequestMethod.POST)
	public String adminEnjoyDelete(String num, HttpSession session) throws Exception{
		festiService.setDelete(num, session);
		return "redirect:./aEnjoyList";
	}
	//----------------------------------- reservation 관리 -----------------------------------//
	@RequestMapping(value = "aReserList", method = RequestMethod.GET)
	public ModelAndView adminReserList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("title", "예약");
		mv.addObject("board", "Reser");
		mv.setViewName("admin/aReserList");
		return mv;
	}
	// reservation;
	// reserList;
	// reserInfo;
	// reserUpdate;
	// reserDelete;
}
