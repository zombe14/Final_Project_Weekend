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
		System.out.println("post");
		int result = memberService.setWrite(memberDTO, session);
		System.out.println("post1");
		String message="Join Fail";
		if(result>0) {
			System.out.println("post2");
			message="Join Success";
		}
		mv.setViewName("common/messageMove");
		mv.addObject("message", message);
		mv.addObject("path", "../");
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void getSelect()throws Exception{}
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void getAgree()throws Exception{}
	
}
