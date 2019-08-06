package com.project.weekend;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;

@Controller
@RequestMapping("/callcenter/")
public class CallCenterController {
	
	@RequestMapping(value = "main")
	public void mainSelect(){}
	@RequestMapping(value = "ticketguide")
	public void ticketguideSelect() {}
	@RequestMapping(value = "cancel")
	public void cancel() {}
	
}