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
			mv.setViewName("redirect:../festi/festiSelect?num="+festiQnaDTO.getNum());
		}
		return mv;
	}
	
	@RequestMapping(value = "fqnaUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
	
	@RequestMapping(value = "fqnaUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiQnaDTO festiQnaDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
	
	@RequestMapping(value = "fqnaDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
	
	@RequestMapping(value = "fqnaSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String qnum) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
	
	@RequestMapping(value = "fqnaList", method = RequestMethod.GET)
	public ModelAndView getList(String num, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		return mv;
	}
}
