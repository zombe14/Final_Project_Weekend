package com.project.weekend;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.comments.CommentsDTO;
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
public class FestiController{
	
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
		String num = "f"+festiService.getNum();
		mv.addObject("num", num);
		mv.addObject("board", "festi");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/festiWrite");
		return mv;
	}
	//write process - post
	@RequestMapping(value = "festiWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(FestiDTO festiDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{ //, List<DatesDTO> datesDTOs
		ModelAndView mv = new ModelAndView();
		String path = "board/boardTile";
		int res = festiService.setWrite(festiDTO, filelist, session);
		
		if(res>0) {
			path = "redirect:./festiSelect?num="+festiDTO.getNum();
		} else {
			path = "redirect:./festiList";
		}
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "optionList", method = RequestMethod.GET)
	public ModelAndView getOptionList(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<DatesDTO> list = datesService.getList(num);
		System.out.println(num);
		System.out.println(list.size());
		mv.addObject("clist", list);
		mv.addObject("num",num);
		mv.setViewName("board/optionList");
		return mv; 
	}
	
	@ResponseBody
	@RequestMapping(value = "optionDelete", method = RequestMethod.POST)
	public int setOptionDelete(int dnum, HttpSession session) throws Exception{
		return festiService.setOptionDelete(dnum, session);
	}
	
	@ResponseBody
	@RequestMapping(value = "optionWrite", method = RequestMethod.POST)
	public int setOptionWrite(DatesDTO datesDTO, HttpSession session) throws Exception{
		int res = festiService.setOptionWrite(datesDTO, session);
		return res;
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
	public ModelAndView getSelect(String num, PageMaker pageMaker, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{

		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num, session, request,response);
		pageMaker.setNum(num);
		List<AfterDTO> afterlist = afterService.getList(pageMaker);
		List<FestiQnaDTO> qnalist = festiQnaService.getList(pageMaker);
		List<DatesDTO> dateslist = datesService.getList(num);
		mv.addObject("option", dateslist);

		mv.addObject("qna", qnalist);
		mv.addObject("after", afterlist);
		mv.addObject("dto", festiDTO);
		mv.addObject("board", "festi");
		mv.addObject("boardTitle", "Festival");
		mv.setViewName("board/festiSelect");

		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "getOptions", method = RequestMethod.POST)
	public List<DatesDTO> getOptions(DatesDTO datesDTO) throws Exception{
		List<DatesDTO> list = datesService.getOptions(datesDTO);
		return list;		
	}
	
	@ResponseBody
	@RequestMapping(value = "getSelectOption", method = RequestMethod.POST)
	public DatesDTO getSelectOption(int dnum, HttpSession session) throws Exception{
		DatesDTO datesDTO = datesService.getSelect(dnum, session);
		return datesDTO;
	}
	
	// update-form
	@RequestMapping(value = "festiUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getSelect(num, session, request,response);
		List<DatesDTO> list = datesService.getList(num);
		mv.addObject("option", list);
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
	public String setDelete(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		int category = festiService.getSelect(num,session,request,response).getCategory();
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




