package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {
	@RequestMapping(value = "MyPageBoard")
	public void MyPageBoard() throws Exception{}
}
	