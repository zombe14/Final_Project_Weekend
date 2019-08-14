package com.project.weekend.member;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.file.MemberFileDAO;
import com.project.weekend.file.MemberFileDTO;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private MemberFileDAO memberFileDAO;

	// 상혁 시작;
	// 관리자;
	// 리스트
	public List<MemberDTO> getList(HttpSession session, PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<MemberDTO> list = memberDAO.getList(pageMaker);
		int totalCount = memberDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	// 회원 등급 조정
	// 등급 UP
	public int setUpdateP(String id) throws Exception{
		int result = memberDAO.setUpdateP(id);
		return result;
	}
	// 등급 DOWN
	public int setUpdateM(String id) throws Exception{
		int result = memberDAO.setUpdateM(id);
		return result;
	}
	// 회원 삭제
	public int setDelete(String id) throws Exception{
		int result = memberDAO.setDelete(id);
		return result;
	}
	// 마이 페이지;
	public int setUpdateMy(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setUpdateMy(memberDTO);
		return result; 
	}
	// 상혁 끝;
	
	
	public MemberDTO getNickname(MemberDTO memberDTO)throws Exception{
		return memberDAO.getNickname(memberDTO);
	}
	
	public MemberDTO getId(MemberDTO memberDTO)throws Exception{
		return memberDAO.getId(memberDTO);
	}

	public int setUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setUpdate(memberDTO);
	}
	public int setUpdatezero(MemberDTO memberDTO)throws Exception{
		return memberDAO.setUpdatezero(memberDTO);
	}
	public int setUpdateoverlap(MemberDTO memberDTO)throws Exception{
		return memberDAO.setUpdateoverlap(memberDTO);
	}
	public int setWrite(MemberDTO memberDTO, MultipartFile photo, HttpSession session)throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/member");
		System.out.println(realPath);
		String fname = fileSaver.saveFile(realPath, photo);
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		memberFileDTO.setId(memberDTO.getId());
		memberFileDTO.setFname(fname);
		memberFileDTO.setOname(photo.getOriginalFilename());
		int result = memberDAO.setWrite(memberDTO);
		result = memberFileDAO.setWrite(memberFileDTO);
		return result;
	}
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelect(memberDTO);
	}
	public MemberDTO getSelectCount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectCount(memberDTO);
	}
	public MemberDTO getSelectOverlap(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectOverlap(memberDTO);
	}
	
	
	
	
	
}
