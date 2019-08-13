package com.project.weekend.board.festi;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;
import com.project.weekend.board.festi.FestiDAO;
import com.project.weekend.board.festi.FestiDTO;

public class FestiDAOImplTest extends AbstractTest{
	
	@Inject
	private FestiDAO dao;

	@Test
	public void setWrite() throws Exception {
		FestiDTO f = new FestiDTO();
		f.setCategory(1);
		f.setContents("FestiDAOImpl Test");
	
		f.setTitle("Festi");
		f.setWriter("FestiDAOImpl");
		//f.setPrice(0);
		
		f.setHit(0);
		f.setLocal("서울");
		f.setTop(0);
		//f.setTotal(0);

		
		int res = dao.setWrite(f);
		
		assertEquals(1, res);
		
	}

}
