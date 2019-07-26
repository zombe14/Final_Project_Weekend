package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.file.FileDTO;

@Controller
public class AjaxController {
	
	// upload file download
	@RequestMapping(value = "/ajax/fileDownload", method = RequestMethod.POST)
	public ModelAndView fileDownload(FileDTO fileDTO, String board) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("file", fileDTO);
		mv.addObject("board", "board");
		mv.setViewName("fileDown");
		
		return mv;
	}

}
