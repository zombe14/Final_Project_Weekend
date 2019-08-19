package com.project.weekend.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
	// 내 정보 수정
	public int setUpdateMy(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setUpdateMy(memberDTO);
		return result; 
	}
	// 비밀번호 수정;
	// 본인 여부 확인;
	public int getUpdateCheck(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.getUpdateCheck(memberDTO);
		return result;
	}
	// pw 변경;
	public int setUpdatePs(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setUpdatePs(memberDTO);
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
	public MemberDTO getSelectkakao(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectkakao(memberDTO);
	}
	public MemberDTO getSelectCount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectCount(memberDTO);
	}
	public MemberDTO getSelectOverlap(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectOverlap(memberDTO);
	}
	public MemberDTO getSelectGrade(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectGrade(memberDTO);
	}
	public MemberDTO getSelectEmail(MemberDTO memberDTO)throws Exception{
		return memberDAO.getSelectEmail(memberDTO);
	}
	public MemberDTO getjumin(MemberDTO memberDTO)throws Exception{
		return memberDAO.getjumin(memberDTO);
	}
	
	//탈퇴
		public void kakaoDelete(MemberDTO memberDTO)throws Exception{
			URL url=null;
			HttpURLConnection con = null;
			String header="Bearer ";
			String kakaoUrl="https://kapi.kakao.com/v1/user/unlink";
			header=header+memberDTO.getAccess_token();
			
			url = new URL(kakaoUrl);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.addRequestProperty("Authorization", header);
			int resultcode = con.getResponseCode();
			System.out.println(resultcode);
			System.out.println(memberDTO.getAccess_token());
		}
		
		
		//로그아웃(token 해제)
		public void kakaoLogout(MemberDTO memberDTO)throws Exception{
			URL url=null;
			HttpURLConnection con = null;
			String header="Bearer ";
			String kakaoUrl="https://kapi.kakao.com/v1/user/logout";
			header=header+memberDTO.getAccess_token();
			
			url = new URL(kakaoUrl);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.addRequestProperty("Authorization", header);
		}
		
		
		
		//로그인 성공시 사용자 정보를 가져오기
		public MemberDTO getInfo(String access_token) throws Exception {
			URL url=null;
			HttpURLConnection con = null;
			String header="Bearer ";
			String kakaoUrl="https://kapi.kakao.com/v2/user/me";
			header=header+access_token;
			
			url = new URL(kakaoUrl);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.addRequestProperty("Authorization", header);
			
			int resultCode = con.getResponseCode();
			BufferedReader br= null;
			MemberDTO memberDTO=null;
			if(resultCode==200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				memberDTO = new MemberDTO();
				
				String resultMessage=null;
				StringBuffer sb = new StringBuffer();
				while( (resultMessage=br.readLine()) != null) {
					sb.append(resultMessage);
				}
				JSONParser jsonParser = new JSONParser();
				JSONObject js = (JSONObject)jsonParser.parse(sb.toString());
				JSONObject js2 = (JSONObject)js.get("properties");
				JSONObject js3 = (JSONObject)js.get("kakao_account");
				memberDTO.setId(js.get("id").toString());
				memberDTO.setEmail(js3.get("email").toString());
				memberDTO.setNickname(js2.get("nickname").toString());
				memberDTO.setAccess_token(access_token);
				
			}else {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}
			
			br.close();
			
			return memberDTO;
		}
		
		public MemberDTO getInfo1(String access_token) throws Exception {
			URL url=null;
			HttpURLConnection con = null;
			String header="Bearer ";
			String kakaoUrl="https://kapi.kakao.com/v2/user/me";
			header=header+access_token;
			url = new URL(kakaoUrl);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.addRequestProperty("Authorization", header);
			
			int resultCode = con.getResponseCode();
			BufferedReader br= null;
			MemberDTO memberDTO=null;
			if(resultCode==200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				memberDTO = new MemberDTO();
				
				String resultMessage=null;
				StringBuffer sb = new StringBuffer();
				while( (resultMessage=br.readLine()) != null) {
					sb.append(resultMessage);
				}
				JSONParser jsonParser = new JSONParser();
				JSONObject js = (JSONObject)jsonParser.parse(sb.toString());
				JSONObject js2 = (JSONObject)js.get("properties");
				JSONObject js3 = (JSONObject)js.get("kakao_account");
				memberDTO.setId(js.get("id").toString());
				memberDTO.setEmail(js3.get("email").toString());
				memberDTO.setName(js2.get("nickname").toString());
				memberDTO.setAccess_token(access_token);
			}else {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}
			
			br.close();
			
			return memberDTO;
		}
	
	
	
	
}
