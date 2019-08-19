package com.project.weekend;

import java.util.HashMap;
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
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.board.festi.dates.DatesDTO;
import com.project.weekend.board.festi.dates.DatesService;
import com.project.weekend.board.festi.festiQna.FestiQnaDTO;
import com.project.weekend.board.festi.festiQna.FestiQnaService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/festi/")
public class FestiController {
	
	@Inject
	private FestiService festiService;
	@Inject
	private AfterService afterService;
	@Inject
	private FestiQnaService festiQnaService;
	@Inject
	private DatesService datesService;
	
	//write form - get
	@RequestMapping(value = "festiWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "festi");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/festiWrite");
		return mv;
	}
	
	//write process - post
	@RequestMapping(value = "festiWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(FestiDTO festiDTO, List<MultipartFile> filelist, HashMap<String, Object> datesDTOs, HttpSession session) throws Exception{ //, List<DatesDTO> datesDTOs
		ModelAndView mv = new ModelAndView();
		String path = "board/boardTile";
		System.out.println("con : "+datesDTOs.size());
		int res = festiService.setWrite(festiDTO, filelist, datesDTOs, session);
		
		if(res>0) {
			path = "redirect:./festiSelect?num="+festiDTO.getNum();
		} else {
			path = "redirect:./festiList";
		}
		mv.setViewName(path);
		return mv;
	}
	
	// list
	@RequestMapping(value = "festiList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("board", "festi");
		mv.addObject("boardTitle", "Festival");
		mv.addObject("region", pageMaker.getRegion());
		mv.addObject("category", pageMaker.getCategory());
		mv.addObject("pager", pageMaker);
		mv.setViewName("board/boardTile");
		return mv;
	}
	
	// select
	@RequestMapping(value = "festiSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num, PageMaker pageMaker) throws Exception{

		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num);
		pageMaker.setNum(num);
		List<AfterDTO> afterlist = afterService.getList(pageMaker);
		List<FestiQnaDTO> qnalist = festiQnaService.getList(pageMaker);
		mv.addObject("qna", qnalist);
		mv.addObject("after", afterlist);
		mv.addObject("dto", festiDTO);
		mv.addObject("board", "festi");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/festiSelect");

		return mv;
	}
	
	// update-form
	@RequestMapping(value = "festiUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num);
		mv.addObject("dto", festiDTO);
		mv.addObject("board", "festi");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/festiUpdate");
		return mv;
	}
	
	//update-process
	@RequestMapping(value = "festiUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiDTO festiDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = festiService.setUpdate(festiDTO, session);
		mv.setViewName("redirect:./festiSelect?num="+festiDTO.getNum());
		return mv;
	}
	
	@RequestMapping(value = "festiDelete", method = RequestMethod.POST)
	public String setDelete(String num,  HttpSession session) throws Exception{
		int category = festiService.getSelect(num).getCategory();
		int res = festiService.setDelete(num, session);
		String path = "redirect:./festiSelect?num="+num;
		if (res>0) {
			path = "redirect:./festiList?category="+category;
		} else {
			
		}
		return path;
	}
	
	//festiMain
	@RequestMapping(value = "festiMain")
	public void festiMain() throws Exception{};
}
