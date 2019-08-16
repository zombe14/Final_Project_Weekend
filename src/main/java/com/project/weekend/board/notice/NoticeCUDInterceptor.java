package com.project.weekend.board.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NoticeCUDInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean res = false;
		HttpSession session = request.getSession();
		Object member = session.getAttribute("member");
		System.out.println("member : "+member);
		int grade = (Integer)session.getAttribute("grade");
		if(member == null) {
			response.sendRedirect("../member/memberLogin");
		} else if(grade != 3) {
			response.sendRedirect("./noticeList");
			//권한이 없습니다. 알림창 뜨게
		} else {
			res = true;
		}
		return res;
	}

}
