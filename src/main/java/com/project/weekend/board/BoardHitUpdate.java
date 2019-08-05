package com.project.weekend.board;

import javax.inject.Inject;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.project.weekend.board.notice.NoticeDAOImpl;

@Component
@Aspect
public class BoardHitUpdate {
	
	@Inject
	private NoticeDAOImpl noticeDAOImpl;
	
	@Pointcut("* com.project.weekend.board..*Serivice*.getSelect(..)")
	
	@AfterReturning
	public void setHitUpdate(String num) throws Exception {
		noticeDAOImpl.setHitUpdate(num);
	}
}
