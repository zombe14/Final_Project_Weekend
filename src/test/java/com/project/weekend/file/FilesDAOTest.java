package com.project.weekend.file;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.project.weekend.AbstractTest;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;

public class FilesDAOTest extends AbstractTest {

	@Inject
	private FileDAO fileDAO;
	
	//@Test
	public void setWrite() throws Exception {
		List<FileDTO> files = new ArrayList<FileDTO>();
		FileDTO f = new FileDTO();
		f.setNum(111);
		f.setFname("cccc.jpg");
		f.setOname("vvvv.jpg");
		files.add(f);
		FileDTO f2 = new FileDTO();
		f2.setNum(111);
		f2.setFname("cccc.jpg");
		f2.setOname("vvvv.jpg");
		files.add(f2);
		System.out.println(files.size());
		int res = fileDAO.setWrite(f);
		assertNotEquals(res, 0);
	}
	
	//@Test
	public void setUpdate() throws Exception{
		FileDTO f = new FileDTO();
		f.setFnum(35);
		f.setOname("bbbb.jpg");
		f.setFname("cccc.jpg");
		int res = fileDAO.setUpdate(f);
		assertEquals(res, 1);
	}
	
	//@Test
	public void getList() throws Exception{
		List<FileDTO> list = fileDAO.getList(111);
		System.out.println(list.size());
		assertNotEquals(list.size(), 0);
	}
	
	//@Test
	public void setDelete() throws Exception{
		assertEquals(1, fileDAO.setDelete(28));
	}
	
	@Test
	public void setDeleteAll() throws Exception{
		int res = fileDAO.setDeleteAll(0);
		assertNotEquals(0, res);
	}

}
