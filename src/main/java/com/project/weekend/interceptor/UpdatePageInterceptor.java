package com.project.weekend.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;



public class UpdatePageInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	private FestiService festiService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		boolean result=false;
		FestiService festiService = new FestiService();
		String num = request.getParameter("num");
		String writer = request.getParameter("writer");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		Object grade = session.getAttribute("grade");
		if(obj!=null) {
			if(grade.equals(2)){
				if(obj.equals(writer)) {
					result=true;
				}else {
					response.sendRedirect("../festi/festiSelect?num="+num);
				}
			}else {
				response.sendRedirect("../festi/festiList?category=1");
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
