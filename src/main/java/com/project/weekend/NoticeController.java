package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.weekend.board.notice.NoticeDTO;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
	
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public void noticeWrite() throws Exception{
		
	}
	
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public void noticeWrite(NoticeDTO noticeDTO) throws Exception{
		
	}
	
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdate() throws Exception{
		
	}
	
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public void noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		
	}
	
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public void noticeDelete(int num) throws Exception{
		
	}
	
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public void noticeSelect(int num) throws Exception{
		
	}
	
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public void noticeList() throws Exception{
		
	}
	
}
