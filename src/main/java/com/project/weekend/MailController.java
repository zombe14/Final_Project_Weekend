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

@Controller
@RequestMapping("/mail/")
public class MailController {
	@Autowired
	private JavaMailSender mailSender;
	@Inject
	private MailService mailService;
	@RequestMapping(value = "/mailSending",method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request){
		
	    String setfrom = "ts560593@gmail.com";         
	    String tomail  = request.getParameter("email");     // 받는 사람 이메일
	    String title   = "회원가입"; // 제목
	    String content = "회원가입";   // 내용
	   System.out.println(tomail);
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
	    System.out.println("완료");
	    return "redirect:./member/memberJoin";
	  }
		/*
		 * System.out.println("메일"); String setfrom = ""; String tomail =
		 * request.getParameter("email"); String title = request.getParameter("title");
		 * String content = request.getParameter("content"); MimeMessage message =
		 * mailSender.createMimeMessage();
		 * 
		 * 
		 * MimeMessageHelper messageHelper = new
		 * MimeMessageHelper(message,true,"UTF-8");
		 * 
		 * messageHelper.setFrom(setfrom); messageHelper.setTo(tomail);
		 * messageHelper.setSubject(title); messageHelper.setText(content);
		 * 
		 * mailSender.send(message);
		 */
	
	
}
