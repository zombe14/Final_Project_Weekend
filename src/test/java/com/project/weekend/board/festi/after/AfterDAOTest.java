package com.project.weekend.board.festi.after;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.weekend.AbstractTest;
import com.project.weekend.util.PageMaker;

public class AfterDAOTest extends AbstractTest {

	@Inject
	private AfterDAO afterDAO;
	@Autowired
	private PageMaker pageMaker;

	// @Test
	public void test() throws Exception {
		int res = 0;
		for (int i = 0; i < 30; i++) {
			AfterDTO a = new AfterDTO();
			a.setAnum("a" + i);
			a.setContents("afterC" + i);
			a.setNum("f11");
			a.setPoint(5);
			a.setTitle("afterT" + i);
			a.setWriter("afterW" + i);
			res = afterDAO.setWrite(a);
		}
		assertEquals(1, res);
	}

	// @Test
	public void delete() throws Exception {
		int res = afterDAO.setDelete("a0");
		assertEquals(1, res);
	}

	// @Test
	public void insert() throws Exception {
		AfterDTO a = new AfterDTO();
		a.setAnum("a30");
		a.setContents("afterC30");
		a.setNum("f12");
		a.setPoint(5);
		a.setTitle("afterT30");
		a.setWriter("afterW30");
		int res = afterDAO.setWrite(a);
		assertEquals(1, res);
	}

	// @Test
	public void select() throws Exception {
		AfterDTO a = afterDAO.getSelect("a30");
		System.out.println(a.getAnum());
		System.out.println(a.getNum());
	}

	//@Test
	public void count() throws Exception {
		String num = "f11";
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pageMaker", pageMaker);
		map.put("num", num);
		int t = afterDAO.getCount(map);
		assertNotEquals(t, 0);
	}

	@Test
	public void list() throws Exception {
		String num = "f11";
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pageMaker", pageMaker);
		map.put("num", num);
		int totalCount = afterDAO.getCount(map);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		List<AfterDTO> list = afterDAO.getList(map);
		System.out.println(list.size());
		assertNotEquals(0, list.size());
	}

}
