package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeDAOImpl;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;
import com.project.weekend.file.FileDTO;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
	
	@Inject
	private NoticeServiceImpl noticeSerivceImpl;
	
	/*공지 글쓰기*/
	// 글쓰기 폼으로 이동 - admin
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public ModelAndView noticeWrite(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", "Notice");
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	// 글쓰기 프로세스 진행 - admin
	// ** messageMove 만들어서 alert, path 수정하기
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public ModelAndView noticeWrite(BoardDTO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception{
		System.out.println(boardDTO.getTop());

		ModelAndView mv = new ModelAndView();
		String path = "redirect:./noticeList";
		int result = noticeSerivceImpl.setWrite(boardDTO, files, session);
		if(result>0) {
			mv.setViewName(path);
		} else {
			mv.setViewName(path);
		}
		
		return mv;
	}
	
	/*공지 업데이트*/
	// 업데이트 폼으로 이동 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView noticeUpdate(int num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeSerivceImpl.getSelect(num, session);
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", "Notice");
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	// 업데이트 프로세스 진행 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public void noticeUpdate(BoardDTO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception{
		noticeSerivceImpl.setUpdate(boardDTO, files, session);
	}
	
	// 공지 삭제 - admin
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(int num, HttpSession session) throws Exception{
		String path = "./boardSelect?num="+num;
		String message = "실패";
		int res = noticeSerivceImpl.setDelete(num, session);
		if(res>0) {
			path = "redirect:./noticeList";
			message="성공";
		}
		System.out.println(message);
		return path;
	}
	
	// 공지글보기 - all
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView noticeSelect(int num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();

		BoardDTO boardDTO = noticeSerivceImpl.getSelect(num, session);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", "Notice");
		mv.setViewName("board/boardSelect");
		
		return mv;
	}
	
	// 공지리스트 - all
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = noticeSerivceImpl.getList(pageMaker, session);
		List<BoardDTO> top = noticeSerivceImpl.getTopList();
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", "Notice");
		mv.addObject("list", list);
		mv.addObject("top", top);
		mv.addObject("pager",pageMaker);
		mv.setViewName("board/boardList");
		return mv;
	}
	
}
