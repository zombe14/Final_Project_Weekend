package com.project.weekend.board.festi.after;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;

public class AfterServiceTest extends AbstractTest{
	
	@Inject
	private AfterService AfterService;

	@Test
	public void insert() throws Exception{
		int res = 0;
		
			AfterDTO a = new AfterDTO();
			
			a.setContents("afterC");
			a.setNum("f11");
			a.setPoint(5);
			a.setTitle("afterT");
			a.setWriter("afterW");
			/*res = AfterService.setWrite(a);*/
		
	}

}
