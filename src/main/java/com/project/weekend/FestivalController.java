package com.project.weekend;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.festi.FestiServiceImpl;

@Controller
@RequestMapping(value = "/festival/")
public class FestivalController {
	
	@Inject
	private FestiServiceImpl festiServiceImpl;
	
	//write form - get
	@RequestMapping(value = "festivalWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("sort", "festi");
		mv.addObject("board", "festival");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	// list
	@RequestMapping(value = "festivalList", method = RequestMethod.GET)
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("sort", "festi");
		mv.addObject("board", "festival");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/boardTile");
		return mv;
	}
}
