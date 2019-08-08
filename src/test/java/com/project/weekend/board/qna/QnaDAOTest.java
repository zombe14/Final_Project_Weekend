package com.project.weekend.board.qna;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;
import com.project.weekend.board.comments.CommentsDAO;
import com.project.weekend.board.comments.CommentsDTO;
import com.project.weekend.util.PageMaker;

public class QnaDAOTest extends AbstractTest{

	@Inject
	private QnaDAO da;
	@Inject
	private CommentsDAO commentsDAO;
	@Inject
	private PageMaker pageMaker;
	
	@Test
	public void commentsWrite() throws Exception{
		for(int i= 0 ; i<20;i++) {
			CommentsDTO c = new CommentsDTO();
			c.setNum("a24");
			c.setWriter("user"+(i+1));
			c.setContents("comments"+(i+1));
			commentsDAO.setWrite(c);
		}
	}
	
	//@Test
	public void commentslist() throws Exception{
		String num = "a24";
		pageMaker.setNum(num);
		int totalCount = commentsDAO.getCount(pageMaker);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<CommentsDTO> list= new ArrayList<CommentsDTO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("pageMaker", pageMaker);
		list = commentsDAO.getList(pageMaker);
		System.out.println(totalCount);
		System.out.println(list.size());
		assertNotEquals(0, list.size());
	}
	
	//@Test
	public void setReplyWrite() throws Exception{
		QnaDTO qnaDTO = new QnaDTO();
		qnaDTO.setContents("reply");
		qnaDTO.setNum("q1");
		qnaDTO.setRef("q36");
		qnaDTO.setTitle("Reply");
		qnaDTO.setWriter("re");
		qnaDTO.setPw("111");
		int res = da.setReplyWrite(qnaDTO);
		assertEquals(1, res);
	}
	
	//@Test
	public void writeFor() throws Exception{
		for(int i = 0 ; i<30;i++) {		
			QnaDTO q = new QnaDTO();
			q.setContents("q C "+i);
			q.setPw("1234");
			q.setTitle("q T "+i);
			q.setWriter("qW"+i);
			da.setWrite(q);
		}
	}
	
	//@Test
	public void write() throws Exception{
		QnaDTO q = new QnaDTO();
		q.setContents("q1 C");
		q.setPw("1234");
		q.setTitle("q1 T");
		q.setWriter("q1-W");
		q.setNum("0");
		int res = da.setWrite(q);
		assertEquals(1, res);
	}
	
	//@Test
	public void selectANDupdate() throws Exception{
		QnaDTO q = da.getSelect("0");
		System.out.println(q.getContents());
		q.setContents("q1-C-U");
		int res = da.setUpdate(q);
		System.out.println(q.getContents());
		assertEquals(1, res);
	}
	
	//@Test
	public void list() throws Exception{
		int totalCount = da.getCount(pageMaker);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<QnaDTO> l = da.getList(pageMaker);
		System.out.println(totalCount);
		System.out.println(l.size());
		assertNotEquals(0, l.size());
	}

}
