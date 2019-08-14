package com.project.weekend.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

<<<<<<< HEAD:src/main/java/com/project/weekend/interceptor/memberInterceptor.java
public class memberInterceptor extends HandlerInterceptorAdapter {
	
=======
public class MemberInterceptor extends HandlerInterceptorAdapter {

>>>>>>> master:src/main/java/com/project/weekend/interceptor/MemberInterceptor.java
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
<<<<<<< HEAD:src/main/java/com/project/weekend/interceptor/memberInterceptor.java
		Object obj = session.getAttribute("memberAgree");
		boolean result = false;
		if(obj!=null) {
			result = true;
=======
		Object obj = session.getAttribute("member");
		boolean result=false;
		if(obj != null) {
			result=true;
>>>>>>> master:src/main/java/com/project/weekend/interceptor/MemberInterceptor.java
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
