package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	private static final String b1 = "qna";
	private static final String b2 = "QnA";
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName("board/qnaWrite");
		return mv;
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setWrite(qnaDTO, filelist, session);
		String path = "redirect:./qnaSelect?num="+qnaDTO.getNum();
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaDTO> list = qnaService.getList(pageMaker, session);
		String path = "board/boardList";
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName(path);
		return mv;
	}
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaDTO qnaDTO = qnaService.getSelect(num, session);
		String path = "board/boardUpdate";
		mv.addObject("dto", qnaDTO);
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName(path);
		return mv;
	}
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(QnaDTO qnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setUpdate(qnaDTO, filelist, session);
		String path = "redirect:./qnaSelect?num="+qnaDTO.getNum();
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName(path);
		return mv;
	}
	@RequestMapping(value = "qnaSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaDTO qnaDTO = qnaService.getSelect(num, session);
		String path = "board/boardSelect";
		mv.addObject("dto", qnaDTO);
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName(path);
		return mv;
	}
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public ModelAndView setDelete(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = qnaService.setDelete(num, session);
		String path = "redirect:./qnaList";
		mv.addObject("board", b1);
		mv.addObject("boardTitle", b2);
		mv.setViewName(path);
		return mv;
	}
	
}
