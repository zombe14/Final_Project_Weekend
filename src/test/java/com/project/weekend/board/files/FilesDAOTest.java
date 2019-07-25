package com.project.weekend.board.files;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;

public class FilesDAOTest extends AbstractTest {

	@Inject
	private FilesDAO filesDAO;
	
	//@Test
	public void setWrite() throws Exception {
		for(int i = 0;i<10;i++){
			FilesDTO f = new FilesDTO();
			f.setNum(94);
			f.setFname("test1.jpg");
			f.setOname("empty.jpg");
			int res = filesDAO.setWrite(f);
		}
		//assertEquals(res, 1);
	}
	
	//@Test
	public void setUpdate() throws Exception{
		FilesDTO f = new FilesDTO();
		f.setFnum(8);
		f.setOname("updateEmpty1.jpg");
		f.setFname("updateTest1.jpg");
		int res = filesDAO.setUpdate(f);
		assertEquals(res, 1);
	}
	
	//@Test
	public void getList() throws Exception{
		List<FilesDTO> list = filesDAO.getList(94);
		System.out.println(list.size());
		assertNotEquals(list.size(), 0);
	}
	
	//@Test
	public void setDelete() throws Exception{
		assertEquals(1, filesDAO.setDelete(18));
	}
	
	@Test
	public void setDeleteAll() throws Exception{
		int res = filesDAO.setDeleteAll(94);
		assertNotEquals(0, res);
	}

}
