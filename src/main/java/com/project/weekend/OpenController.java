package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.open.OpenDAO;
import com.project.weekend.board.open.OpenDTO;
import com.project.weekend.board.open.OpenService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/open/")
public class OpenController {

	@Inject
	private OpenDAO openDAO;
	@Inject
	private OpenService openService;
	private static final String boardTitle = "티켓오픈";
	
	
	/*怨듭� 湲��벐湲�*/
	// 湲��벐湲� �뤌�쑝濡� �씠�룞 - admin
	@RequestMapping(value = "openWrite", method = RequestMethod.GET)
	public ModelAndView openWrite(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> top = openService.getTopList();
		mv.addObject("topCount", top.size());
		mv.addObject("board", "open");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/openWrite");
		
		return mv;
	}
	
	// 湲��벐湲� �봽濡쒖꽭�뒪 吏꾪뻾 - admin
	@RequestMapping(value = "openWrite", method = RequestMethod.POST)
	public ModelAndView openWrite(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./openList";
		String message = "티켓오픈글을 작성하지 못했습니다.";
		int result = openService.setWrite(boardDTO, filelist, session);
		if(result>0) {
			mv.setViewName("redirect:./openList");
		} else {
			mv.addObject("message", message);
			mv.addObject("path", path);
			mv.setViewName("common/messageMove");			
		}

		return mv;
	}
	
	/*怨듭� �뾽�뜲�씠�듃*/
	// �뾽�뜲�씠�듃 �뤌�쑝濡� �씠�룞 - admin
	@RequestMapping(value = "openUpdate", method = RequestMethod.GET)
	public ModelAndView openUpdate(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = openService.getSelect(num, session, request, response);
		int topCount = openService.getTopList().size();
		mv.addObject("topCount", topCount);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "open");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/openUpdate");
		return mv;
	}
	// �뾽�뜲�씠�듃 �봽濡쒖꽭�뒪 吏꾪뻾 - admin
	@RequestMapping(value = "openUpdate", method = RequestMethod.POST)
	public ModelAndView openUpdate(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "redirect:./openSelect?num="+boardDTO.getNum();
		int result = openService.setUpdate(boardDTO, filelist, session);
		if(result>0) {
			mv.setViewName(path);
		} else {
			//mv.setViewName("redirect:./noticeSelect?num="+boardDTO.getNum());
			mv.setViewName(path);
		}
		return mv;
	}
	// 怨듭� �궘�젣 - admin
	@RequestMapping(value = "openDelete", method = RequestMethod.POST)
	public ModelAndView openDelete(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./openSelect?num="+num;
		String message = "티켓오픈 글을 삭제하지 못했습니다.";
		int res = openService.setDelete(num, session);
		if(res>0) {
			path = "../open/openList";
			message="티켓오픈 글을 삭제하였습니다.";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/messageMove");
		return mv;
	}
	// 怨듭�湲�蹂닿린 - all
	@RequestMapping(value = "openSelect", method = RequestMethod.GET)
	public ModelAndView openSelect(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = openService.getSelect(num, session, request, response);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "open");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/openSelect");
		return mv;
	}
	// 怨듭�由ъ뒪�듃 - all
	@RequestMapping(value = "openList", method = RequestMethod.GET)
	public ModelAndView openList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = openService.getList(pageMaker, session);
		List<BoardDTO> top = openService.getTopList();
		
		mv.addObject("board", "open");
		mv.addObject("boardTitle", boardTitle);
		mv.addObject("list", list);
		mv.addObject("top", top);
		
		mv.addObject("pager",pageMaker);
		mv.setViewName("board/openList");
		
		return mv;
	}
}
