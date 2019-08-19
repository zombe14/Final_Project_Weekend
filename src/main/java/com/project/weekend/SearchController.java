package com.project.weekend;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;

@Controller
@RequestMapping(value = "/Search/")
public class SearchController {
	@Inject
	private MemberService memberService;
	// id찾기 창 띄우기;
	@RequestMapping(value = "IdSearch", method = RequestMethod.GET)
	public ModelAndView IdSearch() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/search/idSearch");
		return mv;
	}
	// id찾기 시행;
	@RequestMapping(value = "IdSearch", method = RequestMethod.POST)
	public ModelAndView IdSearch(MemberDTO memberDTO, HttpSession session) throws Exception{
		// jsp에서 이메일 인증을 거친 상태로 도착;
		// 이메일을 이용해서 아이디 검색;
		ModelAndView mv = new ModelAndView();
		MemberDTO result = memberService.getSelectMyIdPw(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
		
	}
	// pw찾기 창 띄우기;
	@RequestMapping(value = "PwSearch", method = RequestMethod.GET)
	public void PwSearch() throws Exception{
	}
	// pw 시행;
	@RequestMapping(value = "PwSearch", method = RequestMethod.POST)
	public void PwSearch(MemberDTO memberDTOm, HttpSession session) throws Exception{
	}
}
