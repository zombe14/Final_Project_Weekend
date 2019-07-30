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

@Controller
@RequestMapping(value = "/festival/")
public class FestivalController {
	
	@Inject
	private FestiService festiService;
	
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
	
	//write process - post
	@RequestMapping(value = "festivalWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(FestiDTO festiDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "board/boardTile";
		int res = festiService.setWrite(festiDTO, filelist, session);
		if(res>0) {
			mv.setViewName(path);
		} else {
			mv.setViewName(path);
		}
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
