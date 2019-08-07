package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	private String after = "후기";

	@Inject
	private AfterService afterService;
	@Inject
	private FestiService festiService;

	@RequestMapping(value = "afterWrite", method = RequestMethod.GET)
	public ModelAndView setWrite(String num, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String title = festiService.getSelect(num).getTitle();
		mv.addObject("originNum", num);
		mv.addObject("originTitle", title);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName("board/afterWrite");
		return mv;
	}

	@RequestMapping(value = "afterWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		int res = 0;

		String path = "redirect:./afterList?num=" + afterDTO.getNum();
		res = afterService.setWrite(afterDTO, filelist, session);
		if (res > 0) {
			path = "redirect:./afterSelect?num=" + afterDTO.getAnum();
		}
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "afterUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String anum, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		AfterDTO afterDTO = afterService.getSelect(anum, session,request,response);
		mv.addObject("dto", afterDTO);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName("board/afterUpdate");
		return mv;
	}

	@RequestMapping(value = "afterUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		int res = 0;
		res = afterService.setUpdate(afterDTO, filelist, session);
		String path = "redirect:../festi/festiSelect?num=" + afterDTO.getNum();
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "afterDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String anum, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int res = afterService.setDelete(anum, session);
		String path = "redirect:./afterAllList";
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "afterSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();

		AfterDTO afterDTO = afterService.getSelect(num, session, request, response);

		String path = "board/boardSelect";
		mv.addObject("dto", afterDTO);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "afterList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker, String num) throws Exception {
		ModelAndView mv = new ModelAndView();

		String path = "board/afterList";

		List<AfterDTO> list = afterService.getList(pageMaker);

		mv.addObject("list", list);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.addObject("pager", pageMaker);
		mv.setViewName(path);
		return mv;
	}

	//////////////////////////////////////////////////////////////////////////////////////

	/*
	@RequestMapping(value = "afterAllList", method = RequestMethod.GET)
	public ModelAndView getAllList(PageMaker pageMaker) throws Exception {
		ModelAndView mv = new ModelAndView();
		String path = "board/boardList";
		List<AfterDTO> list = afterService.getAllList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.addObject("pager", pageMaker);
		mv.setViewName(path);
		return mv;
	}
	*/
}
