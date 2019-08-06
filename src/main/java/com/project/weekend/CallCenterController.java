package com.project.weekend;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/callcenter/")
public class CallCenterController {


	@Inject 
	private NoticeServiceImpl noticeServiceImpl;


	@RequestMapping(value = "main")
	public ModelAndView mainSelect() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> news = noticeServiceImpl.getNewList();
		mv.addObject("list", news);
		mv.setViewName("callcenter/main");
		return mv;
	}

	@RequestMapping(value = "ticketguide")
	public void ticketguideSelect() {
	}

	@RequestMapping(value = "cancel")
	public void cancel() {
	}

	@RequestMapping(value = "legalguide")
	public void legalguide() {
	}

	/*
	 * 고객센터 공지사항
	 * 
	 * @RequestMapping(value = "main", method = RequestMethod.GET) public
	 * ModelAndView mainNoticeList(PageMaker pageMaker ,HttpSession session) throws
	 * Exception{ ModelAndView mv = new ModelAndView(); List<BoardDTO> list =
	 * noticeServiceImpl.getList(pageMaker, session); mv.addObject("board",
	 * "notice"); mv.addObject("list", list); return mv;
	 * 
	 * }
	 */

}