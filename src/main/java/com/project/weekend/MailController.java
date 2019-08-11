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
	@RequestMapping(value = "/mailSend",method = RequestMethod.POST)
	@ResponseBody
	public boolean mailSending(HttpServletRequest request,HttpSession session,@RequestParam(value = "email")String email)throws Exception{
		System.out.println("메일");
		System.out.println(email);


		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
	        String joinCode = String.valueOf(ran);
	        session.setAttribute("joinCode", joinCode);
	 
	        String subject = "회원가입 인증 코드 발급 안내 입니다.";
	        StringBuilder sb = new StringBuilder();
	        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
	        return mailService.send(subject, sb.toString(), "ts560593@gmail.com", email, null);


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
	
}
