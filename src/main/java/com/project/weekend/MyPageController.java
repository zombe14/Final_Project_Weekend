package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {
	@RequestMapping(value = "myPage")
	public void MyPageBoard() throws Exception{
	}
}
	