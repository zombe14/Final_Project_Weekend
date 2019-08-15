package com.project.weekend;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {
	@Inject
	private MemberService memberService;
	// 마이 페이지 메인
	@RequestMapping(value = "myMain")
	public void myMain() throws Exception{
	}
	// 내 정보 출력
	@RequestMapping(value = "mInfoList", method = RequestMethod.GET)
	public void myBoardList() throws Exception{
	}
	// 내 정보 변경
	@RequestMapping(value = "mInfoList", method = RequestMethod.POST)
	public ModelAndView myInfoChange(HttpSession sesssion, MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = memberService.setUpdateMy(memberDTO);
		sesssion.setAttribute("member", memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 비밀번호 변경
	@RequestMapping(value = "mPasswordList", method = RequestMethod.GET)
	public void myPasswordList() throws Exception{
	}
	// 티켓 관리
	@RequestMapping(value = "mTicketList", method = RequestMethod.GET)
	public void myTicketList() throws Exception{
	}
	// 공연 문의 내역
	@RequestMapping(value = "mQnaList", method = RequestMethod.GET)
	public void myQnaList() throws Exception{
	}
	// 내 글 확인
	@RequestMapping(value = "mBoardList", method = RequestMethod.GET)
	public void myWrite() throws Exception{
	}
	// 회원 탍퇴
	@RequestMapping(value = "mByeByeList", method = RequestMethod.GET)
	public void myByeByeList() throws Exception{
	}
}
	