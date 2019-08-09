package com.project.weekend;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.weekend.member.MemberService;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {
	@Inject
	private MemberService memberService;
	// 사용자 재인증
	@RequestMapping(value = "myPageBoard")
	public void MyPageBoard() throws Exception{
	}
	@RequestMapping(value = "mBoardList", method = RequestMethod.GET)
	public void MyPageBoardList() throws Exception{
	}
}
	