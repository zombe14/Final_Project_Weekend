package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeDAOImpl;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
	
	@Inject
	private NoticeDAOImpl noticeDAOImpl;
	@Inject
	private NoticeServiceImpl noticeSerivceImpl;
	private static final String boardTitle = "怨듭�";
	
	
	/*怨듭� 湲��벐湲�*/
	// 湲��벐湲� �뤌�쑝濡� �씠�룞 - admin
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public ModelAndView noticeWrite(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> top = noticeSerivceImpl.getTopList();
		mv.addObject("topCount", top.size());
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/noticeWrite");
		
		return mv;
	}
	
	// 湲��벐湲� �봽濡쒖꽭�뒪 吏꾪뻾 - admin
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public ModelAndView noticeWrite(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./noticeList";
		String message = "湲� �옉�꽦�뿉 �떎�뙣�뻽�뼱�슂";
		int result = noticeSerivceImpl.setWrite(boardDTO, filelist, session);
		if(result>0) {
			mv.setViewName("redirect:./noticeList");
		} else {
			mv.addObject("message", message);
			mv.addObject("path", path);
			mv.setViewName("common/messageMove");			
		}

		return mv;
	}
	
	/*怨듭� �뾽�뜲�씠�듃*/
	// �뾽�뜲�씠�듃 �뤌�쑝濡� �씠�룞 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView noticeUpdate(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeSerivceImpl.getSelect(num, session,request, response);
		int topCount = noticeSerivceImpl.getTopList().size();
		mv.addObject("topCount", topCount);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/noticeUpdate");
		return mv;
	}
	// �뾽�뜲�씠�듃 �봽濡쒖꽭�뒪 吏꾪뻾 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public ModelAndView noticeUpdate(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "redirect:./noticeSelect?num="+boardDTO.getNum();
		int result = noticeSerivceImpl.setUpdate(boardDTO, filelist, session);
		if(result>0) {
			mv.setViewName(path);
		} else {
			//mv.setViewName("redirect:./noticeSelect?num="+boardDTO.getNum());
			mv.setViewName(path);
		}
		return mv;
	}
	// 怨듭� �궘�젣 - admin
	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	public ModelAndView noticeDelete(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./boardSelect?num="+num;
		String message = "�궘�젣媛� �떎�뙣�뻽�뒿�땲�떎.";
		int res = noticeSerivceImpl.setDelete(num, session);
		if(res>0) {
			path = "../notice/noticeList";
			message="�궘�젣媛� �셿猷뚮릱�뒿�땲�떎.";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/messageMove");
		return mv;
	}
	// 怨듭�湲�蹂닿린 - all
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView noticeSelect(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeSerivceImpl.getSelect(num, session, request, response);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/boardSelect");
		return mv;
	}
	// 怨듭�由ъ뒪�듃 - all
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = noticeSerivceImpl.getList(pageMaker, session);
		List<BoardDTO> top = noticeSerivceImpl.getTopList();
		
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.addObject("list", list);
		mv.addObject("top", top);
		
		mv.addObject("pager",pageMaker);
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
}
