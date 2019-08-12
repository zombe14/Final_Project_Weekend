package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {
	@RequestMapping(value = "myPageBoard")
	public void MyPageBoard() throws Exception{
	}
	@RequestMapping(value = "mBoardList", method = RequestMethod.GET)
	public void MyPageBoardList() throws Exception{
	}
}
	