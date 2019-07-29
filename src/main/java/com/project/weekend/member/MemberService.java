package com.project.weekend.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	// 상혁 test용
	public List<MemberDTO> getList(HttpSession session, MemberDTO memberDTO) throws Exception{
		List<MemberDTO> list = memberDAO.getList(memberDTO);
		return list;
	}
	
	public int setWrite(MemberDTO memberDTO, HttpSession session)throws Exception{
		System.out.println("result");
		int result = memberDAO.setWrite(memberDTO);
		return result;
	}
	
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelect(memberDTO);
	}
	
}
