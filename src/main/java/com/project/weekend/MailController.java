package com.project.weekend;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.weekend.mail.MailService;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;

@Controller
@RequestMapping("/mail/")
public class MailController {
	@Autowired
	private JavaMailSender mailSender;
	@Inject
	private MailService mailService;
	@Inject
	private MemberService memberService;
	@RequestMapping(value = "mailSending",method = RequestMethod.POST)
	@ResponseBody
	public int mailSending(HttpServletRequest request,HttpSession session, MemberDTO memberDTO, String email)throws Exception{
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        int result = 0;
        memberDTO = memberService.getSelectEmail(memberDTO);
        if(memberDTO==null) {
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
	    String setfrom = "ts560593@gmail.com";         
	    String tomail  = request.getParameter("email");     // 받는 사람 이메일
	    String title   = "Weekend 회원 가입 인증이메일 입니다."; // 제목
	    String content = "회원 가입 코드는 '"+joinCode+"' 입니다.";   // 내용
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    result = 1;
        }else {
        	
        }
        return result;
	  }
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
	@ResponseBody
	public int mailCheck(HttpSession session,HttpServletRequest request)throws Exception{
		String emailCode = (String)session.getAttribute("joinCode");
		String Code = request.getParameter("Code");
		int result = 0;
		if(emailCode.equals(Code)) {
			result =1;
		}
		return result;
	}
}
