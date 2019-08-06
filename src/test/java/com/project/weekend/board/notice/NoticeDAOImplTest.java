package com.project.weekend.board.notice;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

public class NoticeDAOImplTest extends AbstractTest {

	@Inject
	private NoticeDAOImpl noticeDAOImpl;
	
	@Test
	public void getNewList() throws Exception{
		List<BoardDTO> list = noticeDAOImpl.getNewList();
		System.out.println(list.size());
	}
	
	//@Test
	public void setWrite() throws Exception {
		for(int i = 0; i<20;i++) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setContents("noticeContents"+i);
			noticeDTO.setTitle("noticeTitle"+i);
			noticeDTO.setTop(0);
			noticeDTO.setNum("test"+i);
			noticeDTO.setWriter("ADMIN");
			int res = noticeDAOImpl.setWrite(noticeDTO);
			assertEquals(res, 1);
		}
	}
	
	//@Test
	public void setDelete() throws Exception{
		int num = 88;
		//int res = noticeDAOImpl.setDelete(num);
		//assertEquals(res, 1);
	}
	
	//@Test
	public void getSelect() throws Exception{
		int num = 87;
		//NoticeDTO noticeDTO = (NoticeDTO)noticeDAOImpl.getSelect(num);
		//assertNotNull(noticeDTO);	
	}
	
	//@Test
	public void setUpdate() throws Exception{
		//NoticeDTO noticeDTO = (NoticeDTO)noticeDAOImpl.getSelect(87);
		//noticeDTO.setTop(1);
		//int res = noticeDAOImpl.setUpdate(noticeDTO);
		//System.out.println(noticeDTO.getTop());
	//	assertEquals(res, 1);
	}
	
	//@Test
	public void getList() throws Exception{
		PageMaker pageMaker = new PageMaker();
		int totalCount = noticeDAOImpl.getTotalCount(pageMaker);
		pageMaker.setSearch("");
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<BoardDTO> list = noticeDAOImpl.getList(pageMaker);
		System.out.println(list.size());
		assertNotEquals(list.size(), 0);
	}
	
	//@Test
	public void getTopList() throws Exception{
		List<BoardDTO> list = noticeDAOImpl.getTopList();
		System.out.println(list.size());
		assertNotEquals(list.size(), 0);
	}
	

}
