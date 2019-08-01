package com.project.weekend.board.qna;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;
import com.project.weekend.util.PageMaker;

public class QnaDAOTest extends AbstractTest{

	@Inject
	private QnaDAO da;
	@Inject
	private PageMaker pageMaker;
	
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
