package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {
	@Inject
	private MemberService memberService;
	@Inject
	private FestiService festiService;
	////////////////////////// 마이 페이지 메인
	@RequestMapping(value = "myMain")
	public void myMain() throws Exception{
	}
	// 본인확인(id와 pw 확인용)
	@RequestMapping(value = "mCheck", method = RequestMethod.POST)
	public ModelAndView myCheck(HttpSession session, MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.getUpdateCheck(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	////////////////////////// 내 정보
	// 내 정보 페이지 출력
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
	// 닉네임 중복 여부(택수씨 코드 사용);
	// 전화번호 중복 여부;
	@RequestMapping(value = "mPhoneCheck", method = RequestMethod.POST)
	public ModelAndView myPhoneCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = memberService.getSelectPhoneMy(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 이메일 중복 여부
	@RequestMapping(value = "mEmailCheck", method = RequestMethod.POST)
	public ModelAndView myMailCheck(MemberDTO memberDTO) throws Exception{
		System.out.println("여기 와야되는데??");
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = memberService.getSelectEmailMy(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 이메일 인증(택수씨 코드 사용);
	////////////////////////// 비밀번호 변경
	// 비밀번호 변경 페이지 출력
	@RequestMapping(value = "mPasswordList", method = RequestMethod.GET)
	public void myPasswordList() throws Exception{
	}
	// 비밀번호 변경(실제 비밀번호 변경)
	@RequestMapping(value = "mPasswordList", method = RequestMethod.POST)
	public ModelAndView myPasswordChange(HttpSession session, MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setUpdatePs(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		session.invalidate();
		return mv;
	}
	////////////////////////// 내 티켓 관리
	// 티켓 관리 페이지 출력
	@RequestMapping(value = "mTicketList", method = RequestMethod.GET)
	public void myTicketList() throws Exception{
	}
	// 티켓 삭제
	public void myTicketDelete() throws Exception{
	}
	////////////////////////// 공연 문의 내역
	// 공연 문의 페이지 출력
	@RequestMapping(value = "mQnaList", method = RequestMethod.GET)
	public void myQnaList() throws Exception{
	}
	public void myQnaSelect() throws Exception{
	}
	////////////////////////// 내 글
	// 내 글 페이지 출력
	@RequestMapping(value = "mBoardList", method = RequestMethod.GET)
	public ModelAndView myWrite(FestiDTO festiDTO, PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getListMy(pageMaker);
		mv.addObject("list", list);
		mv.setViewName("myPage/mBoardList");
		return mv;
	}
	// 내 글 선택
	public void myWriteSelect() throws Exception{
	}
	////////////////////////// 회원 탈퇴
	// 회원 탍퇴 페이지 출력
	@RequestMapping(value = "mByeByeList", method = RequestMethod.GET)
	public void myByeByeList() throws Exception{
	}
	// 회원 탈퇴 진행
	@RequestMapping(value = "mByeBye", method = RequestMethod.POST)
	public ModelAndView myByeBy(String id, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setDelete(id);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		session.invalidate();
		return mv;
	}
}
	