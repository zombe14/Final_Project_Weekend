package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.qna.QnaDTO;
import com.project.weekend.board.qna.QnaService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/qna/")
public class QnaController {

	@Inject
	private QnaService qnaService;
	private static final String board = "qna";
	private static final String board2 = "qnaReply";
	private static final String boardTitle = "Q&A";
	private static final String reply = "Q&A 답변";

	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/qnaWrite");
		return mv;
	}

	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setWrite(qnaDTO, filelist, session);
		String path = "redirect:./qnaSelect?num=" + qnaDTO.getNum();
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "qnaReplyWrite", method = RequestMethod.GET)
	public ModelAndView setReplyWrite(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaDTO qnaDTO = qnaService.getSelect(num, session, request, response);
		mv.addObject("qnaOrigin", qnaDTO);
		mv.addObject("board", board2);
		mv.addObject("boardTitle", reply);
		mv.setViewName("board/qnaWrite");
		return mv;
	}
	
	@RequestMapping(value = "qnaReplyWrite", method = RequestMethod.POST)
	public String setReplyWrite(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int res = qnaService.setReplyWrite(qnaDTO,filelist, session);
		String path = "window.history.back()";
		if(res>0) {
			path = "redirect:./qnaList";
		}
		mv.setViewName("redirect:./qnaList");
		return path;
	}

	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<QnaDTO> list = qnaService.getList(pageMaker, session);
		String path = "board/qnaList";
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		QnaDTO qnaDTO = qnaService.getSelect(num, session, request, response);
		String path = "board/qnaUpdate";
		mv.addObject("dto", qnaDTO);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setUpdate(qnaDTO, filelist, session);
		String path = "redirect:./qnaSelect?num=" + qnaDTO.getNum();
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "qnaSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		num = num.substring(num.lastIndexOf(",")+1);
		QnaDTO qnaDTO = qnaService.getSelect(num, session, request, response);
		String path = "board/qnaSelect";
		mv.addObject("dto", qnaDTO);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}


	
	

	// 원본글
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String ref, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setDelete(ref, session);
		String path = "redirect:./qnaList";
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "qnaReplyDelete", method = RequestMethod.POST)
	public ModelAndView setReplyDelete(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setReplyDelete(num, session);
		String path = "redirect:./qnaList";
		if(res>0) {
			
		}
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "qnaReplyUpdate", method = RequestMethod.GET)
	public ModelAndView setReplyUpdate(String num, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		QnaDTO qnaDTO = qnaService.getSelect(num, session, request, response);
		String path = "board/qnaUpdate";
		mv.addObject("dto", qnaDTO);
		mv.addObject("board", board+"Reply");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}

}
