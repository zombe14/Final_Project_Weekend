package com.project.weekend.file;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.util.FileSaver;

public class FileService {
	
	private FileVO fileVO;
	private FileSaver fileSaver;
	
	public String summernoteFileUpload(MultipartFile file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("/resources/summernote");
		String fname = fileSaver.saveFile(realPath, file);
		return fname;
	}
	
	public int summernoteFileDelete(String fileName, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("/resources/summernote");
		fileName = fileName.substring(fileName.lastIndexOf("/"));
		int result = fileSaver.deleteFile(realPath, fileName);
		return result;
	}

	public int setDelte(FileDAO fileDAO, String board, HttpSession session) throws Exception{
		int result = fileDAO.setDelete(fileVO.getFnum());
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("/resources/"+board);
			result = fileSaver.deleteFile(realPath, fileVO.getFname());
		}
		return result;
	}
}
