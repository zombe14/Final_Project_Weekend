package com.project.weekend.board.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class QnaPwInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean res = false;
		HttpSession session = request.getSession();
		QnaService qnaService = new QnaService();
		Object member = session.getAttribute("member");
		String num = request.getParameter("num");
		String pw = request.getParameter("pw");
		System.out.println(num);
		System.out.println(pw);
		if(member == null) {
			response.sendRedirect("../member/memberLogin");
		} else {
			res = true;
		}
		return res;
	}
	
	

}
