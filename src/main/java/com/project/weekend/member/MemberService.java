package com.project.weekend.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	public MemberDTO getIdd(MemberDTO memberDTO)throws Exception{
		return memberDAO.getIdd(memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setUpdate(memberDTO);
	}
	public int setUpdatezero(MemberDTO memberDTO)throws Exception{
		return memberDAO.setUpdatezero(memberDTO);
	}
	
	
	public int setWrite(MemberDTO memberDTO, HttpSession session)throws Exception{
		int result = memberDAO.setWrite(memberDTO);
		return result;
	}
	
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelect(memberDTO);
	}
	
	
}
