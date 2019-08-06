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
@RequestMapping("/callcenter/")
public class CallCenterController {

	@Inject
	private NoticeServiceImpl noticeServiceImpl;

	@RequestMapping(value = "main")
	public void mainSelect() {
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