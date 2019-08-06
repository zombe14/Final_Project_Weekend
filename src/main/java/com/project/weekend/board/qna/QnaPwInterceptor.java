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
		Object member = session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("../member/memberLogin");
		} else {
			res = true;
		}
		return res;
	}

}
