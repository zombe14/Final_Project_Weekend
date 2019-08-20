package com.project.weekend;


import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.mail.MailService;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;

@Controller
@RequestMapping(value = "/search/")
public class SearchController {
	@Inject
	private MemberService memberService;
	@Inject
	private MailService mailService;
	@Autowired
	private JavaMailSender mailSender;
	// id찾기 창 띄우기;
	@RequestMapping(value = "idSearch", method = RequestMethod.GET)
	public ModelAndView IdSearch() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/search/idSearch");
		return mv;
	}
	// pw찾기 창 띄우기;
	@RequestMapping(value = "pwSearch", method = RequestMethod.GET)
	public void PwSearch() throws Exception{
	}
	// pw 시행;
	@RequestMapping(value = "pwSearch", method = RequestMethod.POST)
	public void PwSearch(MemberDTO memberDTOm, HttpSession session) throws Exception{
	}
	// 이메일 찾기;
	@RequestMapping(value = "mailSearch", method = RequestMethod.POST)
	public ModelAndView MailSearch(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = memberService.getSelectEmailMy(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 이메일 인증번호 발송;
	@RequestMapping(value = "mailSending", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mailSending(HttpServletRequest request,HttpSession session, MemberDTO memberDTO){
        ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        int result = 0;
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
	    String setfrom = "ts560593@gmail.com";         
	    String tomail  = request.getParameter("email");     // 받는 사람 이메일
	    String title   = "Weekend 이메일 인증메일 입니다."; // 제목
	    String content = "인증 코드는 '"+joinCode+"' 입니다.";   // 내용
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    result = 1;
        mv.addObject("result", result);
        mv.setViewName("./common/message");
        return mv;
	  }
	// 인증번호 확인;
	@RequestMapping(value = "mailCheck", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mailCheck(HttpSession session,HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		String emailCode = (String)session.getAttribute("joinCode");
		String Code = request.getParameter("Code");
		int result = 0;
		if(emailCode.equals(Code)) {
			result =1;
		}
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 아이디 메일로 보내기;
	@RequestMapping(value = "idResult", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView idResult(HttpSession session,HttpServletRequest request, MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String emailCode = (String)session.getAttribute("joinCode");
		String Code = request.getParameter("Code");
		int result = 0;
		if(emailCode.equals(Code)) {
			result =1;
			MemberDTO mid = memberService.getSelectMyId(memberDTO);
			String id = mid.getId();
			session.setAttribute("id", id);
			String setfrom = "ts560593@gmail.com";
			String tomail = request.getParameter("email");
			String title = "아이디 찾기 서비스 결과입니다.";
			String content = "회원님의 아이디는 '"+id+"' 입니다.";
			try {
			      MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(tomail);     // 받는사람 이메일
			      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			      messageHelper.setText(content);  // 메일 내용
			      mailSender.send(message);
			    } catch(Exception e){
			      System.out.println(e);
			    }
		}
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
	// 비밀번호 변경하기;
	@RequestMapping(value = "pwResult", method = RequestMethod.POST)
	public ModelAndView pwResult(MemberDTO memberDTO) throws Exception{
		System.out.println("비변 컨트롤러 도착");
		ModelAndView mv = new ModelAndView();
		int pwResult = 0;
		pwResult = memberService.setUpdateMyPw(memberDTO);
		mv.addObject("result", pwResult);
		mv.setViewName("./common/message");
		return mv;
	}
}
