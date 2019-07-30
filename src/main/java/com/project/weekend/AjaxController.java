package com.project.weekend;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;

@Controller
public class AjaxController {
	
	@Inject
	private FileService fileService;
	
	// upload file download
	@RequestMapping(value = "/ajax/fileDownload", method = RequestMethod.POST)
	public ModelAndView fileDownload(FileDTO fileDTO, String board) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("file", fileDTO);
		mv.addObject("board", board);
		mv.setViewName("fileDown");
		
		return mv;
	}
	
	// summernote editor file upload
	@RequestMapping(value = "/ajax/summerFileUpload", method = RequestMethod.POST)
	public ModelAndView summerFileUpload(MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String fileName = session.getServletContext().getContextPath();
		fileName=fileName + "/resources/summernote/"; //File.separator = '/'
		fileName = fileName + fileService.summernoteFileUpload(file, session);
		
		mv.addObject("result", fileName);
		mv.setViewName("common/message");
		return mv;
	}
	
	// summernote editor file delete
	@RequestMapping(value = "/ajax/summerFileDelete", method = RequestMethod.POST)
	public ModelAndView summerFileDelete(String fileName, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int res = fileService.summernoteFileDelete(fileName, session);
		mv.addObject("result", res);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	// update file delete ajax 
	@RequestMapping(value = "/ajax/fileDelete", method = RequestMethod.POST)
	public ModelAndView fileDelete(FileDTO fileDTO, String board, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int res = fileService.setDelete(fileDTO, board, session);
		mv.addObject("result", res);
		mv.setViewName("common/message");
		return mv;
	}

}
