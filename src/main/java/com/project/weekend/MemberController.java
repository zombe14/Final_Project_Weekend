package com.project.weekend;

import java.text.DateFormat;


import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void setWrite(@ModelAttribute MemberDTO memberVO)throws Exception{
		
		System.out.println("get");
	}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public ModelAndView setWrite(MemberDTO memberDTO, HttpSession session,BindingResult bindingResult)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setWrite(memberDTO, session);
		String message="Join Fail";
		if(result>0) {
			message="Join Success";
		}
		mv.setViewName("common/messageMove");
		mv.addObject("message", message);
		mv.addObject("path", "../");
		
		return mv;
	}
	
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void getSelect()throws Exception{}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView getSelect(MemberDTO memberDTO, HttpSession session)throws Exception{
		
		MemberDTO getIdd = memberService.getIdd(memberDTO);
		ModelAndView mv = new ModelAndView();
		int result = memberService.setUpdate(memberDTO);
		
		String message="존재 하지 않는 아이디 입니다.";
		if(getIdd==null) {
			mv.setViewName("common/messageMove");
			mv.addObject("message", message);
			mv.addObject("path", "./memberLogin");
		}else {
			memberDTO = memberService.getSelect(memberDTO);
			message="Login Fail";
			if(result==1) {
				if(memberDTO != null) {
					session.setAttribute("member", memberDTO);
					int updatezero = memberService.setUpdatezero(memberDTO);
					message = "Login Success";	
					mv.setViewName("common/messageMove");
					mv.addObject("message", message);
					mv.addObject("path", "../");
				}else {
					mv.setViewName("common/messageMove");
					mv.addObject("message", message);
					mv.addObject("path", "./memberLogin");
					
				}
			}else {
				
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void getAgree()throws Exception{}
	
	@RequestMapping(value = "memberLogout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	
	
	
	
	
	
}
