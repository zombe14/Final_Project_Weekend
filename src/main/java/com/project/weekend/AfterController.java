package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.comments.CommentsDAO;
import com.project.weekend.board.comments.CommentsDTO;
import com.project.weekend.board.comments.CommentsService;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/after/")
public class AfterController {

	private String after = "후기";
	private String board2 = "comments";

	@Inject
	private AfterService afterService;
	@Inject
	private FestiService festiService;
	@Inject
	private CommentsService commentsService;

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
	public ModelAndView setUpdate(AfterDTO afterDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
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
	public ModelAndView setDelete(String anum, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		String num = afterService.getSelect(anum, session, request, response).getNum();
		int res = afterService.setDelete(anum, session);
		String path = "redirect:../festi/festiSelect?num="+num;
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);
		return mv;
	}

	@RequestMapping(value = "afterList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker, String num) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<AfterDTO> list = afterService.getList(pageMaker);
		String path = "board/afterList";
		mv.addObject("pager", pageMaker);
		mv.addObject("list", list);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		mv.setViewName(path);		
		return mv;
	}

	@RequestMapping(value = "afterSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num, PageMaker pageMaker, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		AfterDTO afterDTO = afterService.getSelect(num, session, request, response);
		String path = "board/afterSelect";
		int cCnt = commentsService.getAmount(pageMaker);
		mv.addObject("cCnt",cCnt);
		mv.addObject("dto", afterDTO);
		mv.addObject("board", "after");
		mv.addObject("boardTitle", after);
		/*
		mv.addObject("board2", board2);
		List<CommentsDTO> list = commentsService.getCommentsList(pageMaker, session);
		mv.addObject("list", list);
		*/
		mv.addObject("pager", pageMaker);
		mv.setViewName(path);
		return mv;
	}
	
	
	/* -----------------댓글----------------------- */
	
	@RequestMapping(value = "commentsList", method = RequestMethod.GET)
	public ModelAndView getCommentsList(PageMaker pageMaker, HttpSession session)  throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CommentsDTO> list = commentsService.getCommentsList(pageMaker, session);
		mv.addObject("clist", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("board", "comments");
		mv.setViewName("board/commentsList");
		return mv;
	}

	@RequestMapping(value = "commentsWrite", method = RequestMethod.POST)
	@ResponseBody
	public int setCommentsWrite(CommentsDTO commentsDTO) throws Exception{
		int result = commentsService.setCommentsWrite(commentsDTO);
		return result;
	}
	
	@RequestMapping(value = "commentsDelete", method = RequestMethod.POST)
	@ResponseBody
	public int setCommentsDelete(int cnum, HttpSession session) throws Exception{
		int res = commentsService.setCommentsDelete(cnum, session);
		return res;
	}
	
	@RequestMapping(value = "commentsUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int setCommentsUpdate(CommentsDTO commentsDTO, HttpSession session) throws Exception{
		int res = commentsService.setCommentsUpdate(commentsDTO, session);
		return res;
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
