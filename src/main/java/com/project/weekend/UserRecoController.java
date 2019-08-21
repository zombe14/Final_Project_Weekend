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
import com.project.weekend.board.comments.CommentsService;
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
@RequestMapping(value = "/UserReco/")
public class UserRecoController{
	@Inject
	private FestiService festiService;
	@Inject
	private CommentsService commentsService;
	// 리스트 출력;
	@RequestMapping(value = "UserRecoList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getUserRecoList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.setViewName("board/UserRecoList");
		return mv;
	}
	// 글선택
	@RequestMapping(value = "UserRecoSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getUserRecoSelect(num);
		int cCnt = commentsService.getAmount(pageMaker);
		mv.addObject("cCnt",cCnt);
		mv.addObject("list", festiDTO);
		mv.setViewName("board/UserRecoSelect");
		return mv;
	}
	// 글쓰기;
	// 글쓰기 폼으로 이동;
	@RequestMapping(value = "UserRecoWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = new FestiDTO();
		int num = festiService.getNum();
		festiDTO.setNum("f"+num);
		mv.addObject("num", festiDTO.getNum());
		mv.addObject("board", "UserReco");
		mv.setViewName("/board/UserRecoWrite");
		return mv;
	}
	// 글쓰기 진행;
	@RequestMapping(value = "UserRecoWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(FestiDTO festiDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = festiService.setUserRecoWrite(festiDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 글수정;
	// 글수정 폼으로;
	@RequestMapping(value = "UserRecoUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getUserRecoSelect(num);
		mv.addObject("list", festiDTO);
		mv.setViewName("board/UserRecoUpdate");
		return mv;
	}
	// 글수정 진행;
	@RequestMapping(value = "UserRecoUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiDTO festiDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "redirect:./UserRecoSelect?num="+festiDTO.getNum();
		int result = festiService.setUserRecoUpdate(festiDTO);
		mv.addObject("result", result);
		mv.setViewName(path);
		return mv;
	} 
	// 글삭제;
	@RequestMapping(value = "UserRecoDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./UserRecoSelect?num="+num;
		String message = "유저오픈 글을 삭제하지 못했습니다.";
		int result = festiService.setUserRecoDelete(num);
		if(result>0) {
			path = "../UserReco/UserRecoList";
			message="유저오픈 글을 삭제하였습니다.";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("./common/messageMove");
		return mv;
	}
}
