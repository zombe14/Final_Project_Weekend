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
import com.project.weekend.util.PageMaker;

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
			path = "redirect:./festivalList";
		} else {
			path = "redirect:./festivalList";
		}
		mv.setViewName(path);
		return mv;
	}
	
	// list
	@RequestMapping(value = "festivalList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("sort", "festi");
		mv.addObject("board", "festival");
		mv.addObject("boardTitle", "Festival");
		mv.addObject("pager", pageMaker);
		mv.setViewName("board/boardTile");
		return mv;
	}
	
	// select
	@RequestMapping(value = "festivalSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num) throws Exception{

		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num);

		mv.addObject("dto", festiDTO);
		mv.addObject("board", "festival");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/festiSelect");

		return mv;
	}
	
	// update-form
	@RequestMapping(value = "festivalUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num);
		mv.addObject("dto", festiDTO);
		mv.addObject("sort", "festi");
		mv.addObject("board", "festival");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	//update-process
	@RequestMapping(value = "festivalUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiDTO festiDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = festiService.setUpdate(festiDTO);
		mv.setViewName("redirect:./festivalSelect?num="+festiDTO.getNum());
		return mv;
	}
	
	@RequestMapping(value = "festivalDelete", method = RequestMethod.GET)
	public String setDelete(String num) throws Exception{
		int res = festiService.setDelete(num);
		String path = "redirect:./festivalSelect?num="+num;
		if (res>0) {
			path = "redirect:./festivalList";
		}
		return path;
	}
}
