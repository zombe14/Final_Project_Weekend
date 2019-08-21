package com.project.weekend.calendar;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GoogleCalendarDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CalendarMapper.";
	
	public int addCalendar(GoogleCalendarDTO calendarDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"addCalendar", calendarDTO);
	}
	
	public int updateCalendar(GoogleCalendarDTO calendarDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateCalendar", calendarDTO);
	}
	
	public int deleteCalendar(String board) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteCalendar", board);
	}
	
	public String selectEid(String board) throws Exception{
	      return sqlSession.selectOne(NAMESPACE+"selectEid", board);
	   }

}
