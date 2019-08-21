package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
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
@RequestMapping(value = "/WeekReco/")
public class WeekRecoController{
	
	@Inject
	private FestiService festiService;
	@Inject
	private FestiQnaService festiQnaService;
	@Inject
	private DatesService datesService;
	
	// 리스트 출력;
	@RequestMapping(value = "WeekRecoList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getWeekRecoList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("board/WeekRecoList");
		return mv;
	}
	// 글선택
	@RequestMapping(value = "WeekRecoSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getWeekRecoSelect(num);
		mv.addObject("list", festiDTO);
		mv.setViewName("board/WeekRecoSelect");
		return mv;
	}
	// 글쓰기;
	// 글쓰기 폼으로;
	@RequestMapping(value = "WeekRecoWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = new FestiDTO();
		int num = festiService.getNum();
		festiDTO.setNum("f"+num);
		mv.addObject("num", festiDTO.getNum());
		mv.addObject("board", "WeekReco");
		mv.setViewName("/board/WeekRecoWrite");
		return mv;
	}
	// 글쓰기 진행;
	@RequestMapping(value = "WeekRecoWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(FestiDTO festiDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = festiService.setWeekRecoWrite(festiDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 글수정;
	// 글수정 폼으로;
	@RequestMapping(value = "WeekRecoUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getWeekRecoSelect(num);
		mv.addObject("board", festiDTO);
		mv.setViewName("board/WeekRecoUpdate");
		return mv;
	}
	// 글수정 진행;
	@RequestMapping(value = "WeekRecoUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiDTO festiDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = festiService.setWeekRecoUpdate(festiDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	} 
	// 글삭제;
	@RequestMapping(value = "WeekRecoDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./WeekRecoSelect?num="+num;
		String message = "W 추천 글을 삭제하지 못했습니다.";
		int result = festiService.setWeekRecoDelete(num);
		if(result>0) {
			path = "../WeekReco/WeekRecoList";
			message="W 추천 글을 삭제하였습니다.";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("./common/messageMove");
		return mv;
	}
}
