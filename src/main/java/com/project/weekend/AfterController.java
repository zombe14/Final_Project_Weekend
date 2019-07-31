package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/after/")
public class AfterController {
	
	private String after = "After";

	@Inject
	private AfterService afterService;
	@Inject
	private FestiService festiService;
	
	@RequestMapping(value = "afterWrite",method = RequestMethod.GET)
	public ModelAndView setWrite(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String title = festiService.getSelect(num).getTitle();
		mv.addObject("originNum", num);
		mv.addObject("originTitle", title);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	@RequestMapping(value = "afterWrite",method = RequestMethod.POST)
	public ModelAndView setWrite(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = 0;

		res = afterService.setWrite(afterDTO, filelist, session);

		String path = "redirect:./afterList?num="+afterDTO.getNum();
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "afterUpdate",method = RequestMethod.GET)
	public ModelAndView setUpdate(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		AfterDTO afterDTO = afterService.getSelect(num, session);
		mv.addObject("dto", afterDTO);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	@RequestMapping(value = "afterUpdate",method = RequestMethod.POST)
	public ModelAndView setUpdate(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = 0;
		res = afterService.setUpdate(afterDTO, filelist, session);
		String path = "redirect:./boardSelect?anum="+afterDTO.getAnum();
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}
	@RequestMapping(value = "afterDelete",method = RequestMethod.GET)
	public ModelAndView setDelete(String anum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = afterService.setDelete(anum, session);
		String path = "redirect:./boardList";
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value = "afterSelect",method = RequestMethod.GET)
	public ModelAndView getSelect(String anum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		AfterDTO afterDTO = afterService.getSelect(anum, session);
		String path = "board/boardSelect";
		mv.addObject("dto", afterDTO);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}

	
	//////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "afterList",method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker, String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "board/boardList";
		
		List<AfterDTO> list = afterService.getList(pageMaker, num);
		
		mv.addObject("list", list);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);		
		return mv;
	}
	
}
