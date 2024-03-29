package com.project.weekend.board.festi;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.festi.after.AfterDAO;
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.board.festi.dates.DatesDAO;
import com.project.weekend.board.festi.dates.DatesDTO;
import com.project.weekend.board.festi.dates.DatesService;
import com.project.weekend.board.festi.festiQna.FestiQnaDAO;
import com.project.weekend.board.festi.festiQna.FestiQnaService;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.file.FileDAO;
import com.project.weekend.file.FileDTO;
import com.project.weekend.file.FileService;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.util.FileSaver;
import com.project.weekend.util.PageMaker;

@Service
public class FestiService {
	
	@Inject
	private FestiDAO festiDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileService fileService;
	@Inject
	private AfterDAO afterDAO;
	@Inject
	private FestiQnaDAO festiQnaDAO;
	@Inject
	private AfterService afterService;
	@Inject
	private FestiQnaService festiQnaService;
	@Inject
	private DatesDAO datesDAO;
	
	public int setWrite(FestiDTO festiDTO, List<MultipartFile> filelist, HttpSession session) throws Exception {
		int res = festiDAO.setWrite(festiDTO);
		String realPath = session.getServletContext().getRealPath("/resources/images/board");
		for(MultipartFile f : filelist) {
			if(f.getOriginalFilename().length()>0) {				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(festiDTO.getNum());
				fileDTO.setOname(f.getOriginalFilename());
				String fname = fileSaver.saveFile(realPath, f);
				fileDTO.setFname(fname);
				res = fileDAO.setWrite(fileDTO);
			}
		}
		
		return res;
	}
	
	public int setOptionWrite(DatesDTO datesDTO, HttpSession session) throws Exception{
		int res = 0;
		res = datesDAO.setWrite(datesDTO);			
		
				/*
				 * datesDTO.setPrice((Integer)datesDTOs.get(i).get("price2"));
				 * datesDTO.setReg_date((Date)datesDTOs.get(i).get("reg_date"));
				 * datesDTO.setSeat((Integer)datesDTOs.get(i).get("seat"));
				 * datesDTO.setTime((String)datesDTOs.get(i).get("time"));
				 */
				
		return res;
	}
	
	public int setOptionDelete(int dnum, HttpSession session) throws Exception{
		return datesDAO.setDelete(dnum);
	}
	
	public List<FestiDTO> getList(PageMaker pageMaker) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getList(pageMaker);
		pageMaker.makePage(totalCount);
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
		return list;
	}
	public FestiDTO getSelect(String num, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		FestiDTO festiDTO = festiDAO.getSelect(num);
		ArrayList<FileDTO> fileDTOs = (ArrayList<FileDTO>)fileDAO.getList(num);
		festiDTO.setFileDTOs(fileDTOs);
		if(festiDTO.getFileDTOs().size()==1) {
			if(festiDTO.getFileDTOs().get(0).getFname()==null) {
				festiDTO.setFileDTOs(new ArrayList<FileDTO>());
			}
		}
		
	
			// 쿠키를 이용해서 ajax, 새로고침 시 조회수 증가 방지
			boolean isGet = false;
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(Cookie c:cookies) {
					if(c.getName().equals(num)) {
						isGet=true;
					}
				}
			}
			if(!isGet) {
				festiDAO.setHitUpdate(num);
				Cookie c = new Cookie(num, num);
				c.setMaxAge(30*60); // 30분
				response.addCookie(c);
			}
					
		
		return festiDTO;
	}
	
	public int setUpdate(FestiDTO festiDTO, MultipartFile filelist, HttpSession session) throws Exception{
		int res = 0;

		
		if(filelist.getOriginalFilename().length()>0) {
			String realPath =session.getServletContext().getRealPath("/resources/images/board");
			System.out.println(filelist.getOriginalFilename());
			int fnum = festiDAO.getSelect(festiDTO.getNum()).getFileDTOs().get(0).getFnum();
			System.out.println(fnum);
			fileDAO.setDelete(fnum);
			FileDTO fileDTO = new FileDTO();
			fileDTO.setNum(festiDTO.getNum());
			fileDTO.setOname(filelist.getOriginalFilename());
			String fname = fileSaver.saveFile(realPath, filelist);
			fileDTO.setFname(fname);
			res = fileDAO.setWrite(fileDTO);
		}
		
		res = festiDAO.setUpdate(festiDTO);
		return res;
	}
	
	public int setDelete(String num, HttpSession session) throws Exception{
		int res = 0;
		res = festiDAO.setDelete(num);
		res = afterService.setDeleteAll(num, session);
		//res = festiQnaService.setDeleteOrigin(num);
		List<FileDTO> list = fileDAO.getList(num);
		if(list != null) {
			for(FileDTO fileDTO : list) {
				res = fileService.setDelete(fileDTO, "board", session);
			}
		}
		return res;
	}
	public int getNum() throws Exception{
		return festiDAO.getNum();
	}
	// 상혁
	////////////////// 관리자 용;
	// 종류별 게시글 가져오기;
	// w추천, 유저추천, 공연, 축제, 대학로;
	// w 추천 리스트(아래 w추천 board 사용);
	// w 추천 삭제(아래 w추천 board 사용);
	// 유저 추천 리스트(아래 유저 추천 board 사용);
	// 유저 추천 삭제(아래 유저 추천 board 사용);
	// 공연 리스트;
	public List<FestiDTO> getCate1List(PageMaker pageMaker, HttpSession session) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getCate1List(session, pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	// 축제 리스트;
	public List<FestiDTO> getCate2List(PageMaker pageMaker, HttpSession session) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getCate2List(session, pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	// 대학로 리스트;
	public List<FestiDTO> getCate3List(PageMaker pageMaker, HttpSession session) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getCate3List(session, pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	///////////////// 마이 페이지 용;
	// 내글 불러오기
	public List<FestiDTO> getListMy(PageMaker pageMaker) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getListMy(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	//// 외부 board;
	// w 추천;
	// 리스트;
	public List<FestiDTO> getWeekRecoList(HttpSession session, PageMaker pageMaker) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getWeekRecoList(session, pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	// 글선택;
	public FestiDTO getWeekRecoSelect(String num) throws Exception{
		FestiDTO festiDTO = festiDAO.getWeekRecoSelect(num);
		return festiDTO;
	}
	// 글쓰기;
	public int setWeekRecoWrite(FestiDTO festiDTO) throws Exception{
		int result = 0;
		result = festiDAO.setWeekRecoWrite(festiDTO);
		return result;
	} 
	// 글수정;
	public int setWeekRecoUpdate(FestiDTO festiDTO) throws Exception{
		int result = 0;
		result = festiDAO.setWeekRecoUpdate(festiDTO);
		return result;
	}
	// 글삭제;
	public int setWeekRecoDelete(String num) throws Exception{
		int result = 0;
		result = festiDAO.setWeekRecoDelete(num);
		return result;
	}
	// 유저 추천;
	// 리스트;
	public List<FestiDTO> getUserRecoList(HttpSession session, PageMaker pageMaker) throws Exception{
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getUserRecoList(session, pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	// 글선택;
	public FestiDTO getUserRecoSelect(String num) throws Exception{
		FestiDTO festiDTO = festiDAO.getSelect(num);
		return festiDTO;
	}
	// 글쓰기;
	public int setUserRecoWrite(FestiDTO festiDTO) throws Exception{
		int result = 0;
		int num = festiDAO.getNum();
		festiDTO.setNum("f"+num);
		result  = festiDAO.setUserRecoWrite(festiDTO);
		return result;
	}
	// 글수정;
	public int setUserRecoUpdate(FestiDTO festiDTO) throws Exception{
		int result = 0;
		result = festiDAO.setUserRecoUpdate(festiDTO);
		return result;
	}
	// 글삭제;
	public int setUserRecoDelete(String num) throws Exception{
		int result = 0;
		result = festiDAO.setUserRecoDelete(num);
		return result;
	}
	// 랭크;
	// 리스트;
	public List<FestiDTO> getRankList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<FestiDTO> list = festiDAO.getRankList(pageMaker);
		int totalCount = festiDAO.getCount(pageMaker.getCategory());
		pageMaker.makePage(totalCount);
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
		return list;
	}
	
	//원식 홈 랭크 리스트
	public List<FestiDTO> getHomeRankList() throws Exception{
		List<FestiDTO> list = festiDAO.getHomeRankList();
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
			
		return list;
	}
	public List<FestiDTO> getHomeRankList2() throws Exception{
		List<FestiDTO> list = festiDAO.getHomeRankList2();
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
		return list;
	}
	//원식 홈 베스트 리스트
	public List<FestiDTO> getBestList(PageMaker pageMaker) throws Exception{
		List<FestiDTO> list = festiDAO.getBestList(pageMaker);
		for(FestiDTO f : list) {
			String num = f.getNum();
			ArrayList<FileDTO> fileList = (ArrayList<FileDTO>)fileDAO.getList(num);
			f.setFileDTOs(fileList);
		}
		return list;
	}
	
	// 난슬
	/*
	public List<AfterDTO> getPointAvg(PageMaker pageMaker) throws Exception{
		List<FestiDTO> list = festiDAO.getRankList(pageMaker);
		List<AfterDTO> avglist = new ArrayList<AfterDTO>();
		for(FestiDTO f : list) {
			String num = f.getNum();
			int category = f.getCategory();
			pageMaker.setNum(num);
			pageMaker.setCategory(category);
			Double avg = festiDAO.getPointAvg(pageMaker);
			AfterDTO afterDTO = new AfterDTO();
			afterDTO.setNum(num);
			afterDTO.setAvg(avg);
			avglist.add(afterDTO);
		}
		return avglist;
	}
	*/
}