package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
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
	private static final String boardTitle = "FestiQna";

	@RequestMapping(value = "fqnaWrite", method = RequestMethod.GET)
	public ModelAndView setWrite(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num);
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
		System.out.println(res);
		if(res>0) {
			mv.setViewName("redirect:./fqnaSelect?qnum="+festiQnaDTO.getQnum());
		}
		return mv;
	}
	
	@RequestMapping(value = "fqnaDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String qnum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String num = festiQnaService.getSelect(qnum).getNum();
		int res = festiQnaService.setDelete(qnum, session);
		if(res>0) {
			mv.setViewName("redirect:../festi/festiSelect?num="+num);
		} else {
			
		}
		return mv;
	}
	
	@RequestMapping(value = "fqnaSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiQnaDTO festiQnaDTO = festiQnaService.getSelect(qnum);
		mv.addObject("dto", festiQnaDTO);
		mv.addObject("board", board);
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/qnaSelect");
		return mv;
	}
	
	@RequestMapping(value = "fqnaList", method = RequestMethod.GET)
	public ModelAndView getList(String num, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
}
