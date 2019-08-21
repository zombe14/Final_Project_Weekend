package com.project.weekend.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class UserRecoDeleteInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		boolean result=false;
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		Object grade = session.getAttribute("grade");
		Object nickname = session.getAttribute("memberNickname");
		String writer = request.getParameter("writer");
		if(obj!=null) {
			if(grade.equals(1)) {
				if(nickname.equals(writer)) {
					result= true;
				}else {
					response.sendRedirect("../UserReco/UserRecoList");
				}
			}else {
				response.sendRedirect("../UserReco/UserRecoList");
			}
		}else {
			response.sendRedirect("../member/memberLogin");
		}
		
		
		return result;
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
