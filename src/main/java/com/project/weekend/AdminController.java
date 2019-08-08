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
import com.project.weekend.board.qna.QnaDTO;
import com.project.weekend.board.qna.QnaService;
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
	@Inject
	private QnaService qnaService;

	////////////// admin Main; //////////////
	// 여기에 전반적인 뭔가를 뿌려야됨;
	@RequestMapping(value = "adminMain", method = RequestMethod.GET)
	public ModelAndView adminBoard() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("title", "관리자 메인");
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
		mv.addObject("Title", "유저");
		mv.addObject("board", "User");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aUserList");
		return mv;
	}
	// user up grade;(완성)
	@RequestMapping(value = "aUserUpdateP", method = RequestMethod.POST)
	public String adminUserUpdateP(String id) throws Exception{
		memberService.setUpdateP(id);
		return "redirect:./aUserList";
	}
	// user down grade;(완성)
	@RequestMapping(value = "aUserUpdateM", method = RequestMethod.POST)
	public String adminUserUpdateM(String id) throws Exception{
		memberService.setUpdateM(id);
		return "redirect:./aUserList";
	}
	// user delete;(완성)
	@RequestMapping(value = "aUserDelete", method = RequestMethod.POST)
	public String adminUserDelete(String id) throws Exception{
		memberService.setDelete(id);
		return "redirect:./aUserList";
	}
	////////////// board 관리; //////////////
	////////////// notice board; //////////////
	// notice List(완성)
	@RequestMapping(value = "aNoticeList", method = RequestMethod.GET) 
	public ModelAndView adminNoticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		List<BoardDTO> list = noticeServiceImpl.getList(pageMaker, session);
		mv.addObject("Title", "공지사항");
		mv.addObject("board", "Notice"); 
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
	return mv;
	}
	// notice Delete(완성)
	@RequestMapping(value = "aNoticeDelete", method = RequestMethod.POST)
	public String adminNoticeDelete(HttpSession session, String num) throws Exception{
		noticeServiceImpl.setDelete(num, session);
		return "redirect:./aNoticeList";
	}
	@RequestMapping(value = "aEnjoyList", method = RequestMethod.GET)
	public ModelAndView adminEnjoyList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "Enjoy");
		mv.setViewName("admin/aBoardList");
		return mv;
	}
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
	// after;
	public ModelAndView adminAfterList() throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	// recommend;
	public ModelAndView adminRecommend() throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	// rank;
	public ModelAndView adminRankList() throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	//////////////QnA board; //////////////
	// QnaList(완성)
	@RequestMapping(value = "aQnaList", method = RequestMethod.GET)
	public ModelAndView adminQnaList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaDTO> list = qnaService.getList(pageMaker, session);
		mv.addObject("Title", "QnA");
		mv.addObject("board", "Qna");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("admin/aBoardList");
		return mv;
	}
	// QnaDelete(완성)
	@RequestMapping(value = "aQnaDelete", method = RequestMethod.POST)
	public String adminQnaDelete(String num, HttpSession session) throws Exception{
		qnaService.setDelete(num, session);
		return "redirect:./aQnaList";
	}
	////////////// reservation 관리; //////////////
	@RequestMapping(value = "aReserList", method = RequestMethod.GET)
	public ModelAndView adminReserList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("Title", "예약");
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
