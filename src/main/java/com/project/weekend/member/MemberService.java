package com.project.weekend.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	
	public int setWrite(MemberDTO memberDTO, HttpSession session)throws Exception{
		System.out.println("result");
		int result = memberDAO.setWrite(memberDTO);
		return result;
	}
	
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelect(memberDTO);
	}
	
}
