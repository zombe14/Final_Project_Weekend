package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.board.festi.dates.DatesDTO;
import com.project.weekend.board.festi.dates.DatesService;
import com.project.weekend.board.festi.festiQna.FestiQnaDTO;
import com.project.weekend.board.festi.festiQna.FestiQnaService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/UserReco/")
public class FestiController {
	
	@Inject
	private FestiService festiService;
	@Inject
	private AfterService afterService;
	@Inject
	private FestiQnaService festiQnaService;
	@Inject
	private DatesService datesService;
	
	// 리스트 출력;
	@RequestMapping(value = "UserRecoList", method = RequestMethod.GET)
	public void getList() throws Exception{
	}
	// 글선택
	@RequestMapping(value = "UserRecoSelect", method = RequestMethod.GET)
	public void getSelect() throws Exception{
	}
	// 글쓰기;
	@RequestMapping(value = "UserRecoWrite", method = RequestMethod.POST)
	public void setWrite() throws Exception{
	}
	// 글수정;
	// 글수정 폼으로;
	@RequestMapping(value = "UserRecoUpdate", method = RequestMethod.GET)
	public void setUpdate(String num) throws Exception{
		
	}
	// 글수정 진행;
	@RequestMapping(value = "UserRecoUpdate", method = RequestMethod.POST)
	public void setUpdate() throws Exception{
	} 
	// 글삭제;
	@RequestMapping(value = "UserRecoDelete", method = RequestMethod.POST)
	public void setDelete() throws Exception{
	}
}
