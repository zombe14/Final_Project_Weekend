package com.project.weekend;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.festi.FestiService;

@Controller
@RequestMapping(value = "/show/")	// 공연
public class ShowController {
	
	@Inject
	private FestiService festiServiceImpl;
	
	// write - get
	@RequestMapping(value = "showWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("sort", "festi");
		mv.addObject("board", "show");
		mv.addObject("boardTitle", "SHOW");
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	// write - post
	
	// list
	@RequestMapping(value = "showList")
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("sort", "festi");
		mv.addObject("board", "show");
		mv.addObject("boardTitle", "SHOW");
		mv.setViewName("board/boardTile");
		return mv;
	}
	
}
