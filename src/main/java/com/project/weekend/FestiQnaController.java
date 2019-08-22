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

import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.festi.festiQna.FestiQnaDAO;
import com.project.weekend.board.festi.festiQna.FestiQnaDTO;
import com.project.weekend.board.festi.festiQna.FestiQnaService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/festiQna/")
public class FestiQnaController {
	
	@Inject
	private FestiQnaService festiQnaService;
	@Inject
	private FestiService festiService;
	private static final String board = "fqna";
	private static final String board2 = "fqnaReply";
	private static final String boardTitle = "FestiQna";

	@RequestMapping(value = "fqnaWrite", method = RequestMethod.GET)
	public ModelAndView setWrite(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num, session,request,response);
		mv.addObject("origin", festiDTO);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/fqnaWrite");
		return mv;		
	}
	
	@RequestMapping(value = "fqnaWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(FestiQnaDTO festiQnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = festiQnaService.setWrite(festiQnaDTO, filelist, session);
		if (res>0) {
			mv.setViewName("redirect:./fqnaSelect?qnum="+festiQnaDTO.getQnum());
		}
		return mv;
	}
	
	@RequestMapping(value = "fqnaUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiQnaDTO festiQnaDTO = festiQnaService.getSelect(qnum);
		mv.addObject("dto", festiQnaDTO);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/fqnaUpdate");
		return mv;
	}
	
	@RequestMapping(value = "fqnaUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiQnaDTO festiQnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = festiQnaService.setUpdate(festiQnaDTO, filelist, session);
		if(res>0) {
			mv.setViewName("redirect:./fqnaSelect?qnum="+festiQnaDTO.getQnum());
		}
		return mv;
	}

	
	// 원본글
	@RequestMapping(value = "fqnaDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String ref, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String num = festiQnaService.getSelect(ref).getNum();
		int res = festiQnaService.setDelete(ref, session);
		String path = "redirect:../festi/festiSelect?num="+num;
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName(path);
		return mv;
	}

	
	
	@RequestMapping(value = "fqnaReplyDelete", method = RequestMethod.POST)
	public ModelAndView setReplyDelete(String qnum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String num = festiQnaService.getSelect(qnum).getNum();
		int res = festiQnaService.setReplyDelete(qnum, session);
		String path = "redirect:../festi/festiSelect?num="+num;
		if(res>0) {
			
		}
		mv.setViewName(path);
		return mv;
	}
	@RequestMapping(value = "fqnaSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiQnaDTO festiQnaDTO = festiQnaService.getSelect(qnum);
		mv.addObject("dto", festiQnaDTO);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/fqnaSelect");
		return mv;
	}
	
	@RequestMapping(value = "fqnaList", method = RequestMethod.GET)
	public ModelAndView getList(String num, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
	
	@RequestMapping(value = "fqnaReplyWrite", method = RequestMethod.GET)
	public ModelAndView setReplyWrite(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiQnaDTO festiQnaDTO = festiQnaService.getSelect(qnum);
		mv.addObject("origin", festiQnaDTO);
		mv.addObject("board", board2);
		mv.addObject("boardTitle", boardTitle);
		
		mv.setViewName("board/fqnaWrite");
		return mv;
	}
	
	@RequestMapping(value = "fqnaReplyWrite", method = RequestMethod.POST)
	public ModelAndView setReplyWrite(FestiQnaDTO festiQnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = festiQnaService.setReplyWrite(festiQnaDTO);
		if(res>0) {
			mv.setViewName("redirect:../festi/festiSelect?num="+festiQnaDTO.getNum());
		} else {
			mv.setViewName("redirect:../festi/festiSelect?num="+festiQnaDTO.getNum());
		}
		return mv;
	}
}
