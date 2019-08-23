package com.project.weekend.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class FestiQnafqnaUpdateInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		/*
		boolean result=false;
		HttpSession session = request.getSession();
		String writer = request.getParameter("writer");
		String num = request.getParameter("num");
		Object nickname = session.getAttribute("memberNickname");
		Object obj = session.getAttribute("member");
		Object grade = session.getAttribute("grade");
		if(obj!=null) {
			if(grade.equals(3)) {
				result=true;
			}
			if(writer.equals(nickname)) {
				result = true;
			}else {
				response.sendRedirect("../");
			}
			
		}else {
			response.sendRedirect("../member/memberLogin");
		}
		*/
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	

}
