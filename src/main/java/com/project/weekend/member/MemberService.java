package com.project.weekend.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	

	// 상혁 test용 시작
	public List<MemberDTO> getList(HttpSession session, MemberDTO memberDTO) throws Exception{
		List<MemberDTO> list = memberDAO.getList(memberDTO);
		return list;
	}
	// 상혁 test 끝
	public MemberDTO getId(MemberDTO memberDTO)throws Exception{
		return memberDAO.getId(memberDTO);
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
	public MemberDTO getSelectCount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectCount(memberDTO);
	}
}
