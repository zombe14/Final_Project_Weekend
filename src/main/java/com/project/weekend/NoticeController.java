package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	// 글쓰기 폼으로 이동
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public void noticeWrite() throws Exception{}
	
	// 글쓰기 프로세스 진행
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public void noticeWrite(NoticeDTO noticeDTO, HttpSession session) throws Exception{
		int result = noticeSerivceImpl.setWrite(noticeDTO, null, session);
	}
	
	/*공지 업데이트*/
	// 업데이트 폼으로 이동
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdate() throws Exception{
		
	}
	
	// 업데이트 프로세스 진행
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public void noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		
	}
	
	// 공지 삭제
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public void noticeDelete(int num) throws Exception{
		
	}
	
	// 공지글보기
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public void noticeSelect(int num) throws Exception{
		
	}
	
	// 공지리스트
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> lists = noticeSerivceImpl.getList(pageMaker, session);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", "Notice");
		mv.addObject("lists", lists);
		mv.setViewName("board/boardList");
		return mv;
	}
	
}
