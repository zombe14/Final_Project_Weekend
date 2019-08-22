package com.project.weekend.board.qna;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class QnaPwInterceptor extends HandlerInterceptorAdapter {
	@Inject
	private QnaDAO qnaDAO;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean result = false;
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		String num = request.getParameter("num");
		String pw = request.getParameter("pw");
		QnaDTO qnaDTO = qnaDAO.getSelect(num);
		System.out.println(pw);
		if(obj!=null) {
			if(pw!=null) {
				if(pw.equals(qnaDTO.getPw())) {
					result=true;
				}else {
					response.sendRedirect("./qnaList");
				}
			}else {
				result=true;
			}
		}else {
			response.sendRedirect("../member/memberLogin");
		}
		
		return result;
	}
}
