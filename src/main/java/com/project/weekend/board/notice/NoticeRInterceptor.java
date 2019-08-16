package com.project.weekend.board.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NoticeRInterceptor extends HandlerInterceptorAdapter{

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
