package com.project.weekend;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/rank/")
public class RankController {
	@Inject
	private FestiService festiService;
	@RequestMapping(value = "rank_festi")
	public ModelAndView rank(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getRankList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("/rank/rank_festi");
		return mv;
	}
}
