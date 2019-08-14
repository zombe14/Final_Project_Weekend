package com.project.weekend.board.comments;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.weekend.util.PageMaker;

@Service
public class CommentsService {
	
	@Inject
	private CommentsDAO commentsDAO;
	
	public int setCommentsWrite(CommentsDTO commentsDTO) throws Exception{
		System.out.println("ser : "+commentsDTO.getNum());
		int res = commentsDAO.setWrite(commentsDTO);
		return res;
	}
	
	public List<CommentsDTO> getCommentsList(PageMaker pageMaker, HttpSession session) throws Exception{
		
		pageMaker.makeRow();
		List<CommentsDTO> list= commentsDAO.getList(pageMaker);
		int totalCount = commentsDAO.getCount(pageMaker);
		pageMaker.makePage(totalCount);	
	
		return list;
	}
	
	public int setCommentsDelete(int cnum, HttpSession session) throws Exception{
		int res = commentsDAO.setDelete(cnum);
		return res;
	}
	
	public int setCommentsUpdate(CommentsDTO commentsDTO, HttpSession session) throws Exception{
		int res = commentsDAO.setUpdate(commentsDTO);
		return res;
	}
	
	public int getAmount(PageMaker pageMaker) throws Exception{
		int res = commentsDAO.getCount(pageMaker);
		return res;
	}

}
