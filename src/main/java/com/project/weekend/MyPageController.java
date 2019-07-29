package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/MyPage/")
public class MyPageController {
	@RequestMapping(value = "MyPageBoard")
	public String MyPageBoard() throws Exception{
		return "./myPage/MyPageBoard";
	}
}
