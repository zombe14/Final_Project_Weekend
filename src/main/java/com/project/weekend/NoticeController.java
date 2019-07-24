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
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;
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
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public ModelAndView noticeWrite(NoticeDTO noticeDTO, List<MultipartFile> files, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeSerivceImpl.setWrite(noticeDTO, files, session);
		return mv;
	}
	
	/*공지 업데이트*/
	// 업데이트 폼으로 이동 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdate() throws Exception{
		
	}
	
	// 업데이트 프로세스 진행 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public void noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		
	}
	
	// 공지 삭제 - admin
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public void noticeDelete(int num) throws Exception{
		
	}
	
	// 공지글보기 - all
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public void noticeSelect(int num) throws Exception{
		
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
