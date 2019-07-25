package com.project.weekend.board.notice;

import static org.junit.Assert.*;

import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.junit.Test;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.AbstractTest;

public class NoticeServiceImplTest extends AbstractTest{

	@Inject
	private NoticeServiceImpl noticeServiceImpl;
	
	@Test
	public void setWrite() throws Exception{
		HttpSession session = new HttpSession() {
			
			@Override
			public void setMaxInactiveInterval(int interval) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void setAttribute(String name, Object value) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void removeValue(String name) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void removeAttribute(String name) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void putValue(String name, Object value) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isNew() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public void invalidate() {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public String[] getValueNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getValue(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public HttpSessionContext getSessionContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public ServletContext getServletContext() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getMaxInactiveInterval() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public long getLastAccessedTime() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getCreationTime() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Enumeration getAttributeNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getAttribute(String name) {
				// TODO Auto-generated method stub
				return null;
			}
		};
		List<MultipartFile> files = null;
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setContents("serviceTestContents");
		noticeDTO.setTitle("serviceTestTitle");
		noticeDTO.setWriter("ADMIN");
		noticeDTO.setTop(0);
		int res = noticeServiceImpl.setWrite(noticeDTO, files, session);
		assertEquals(res, 1);
	}

}
