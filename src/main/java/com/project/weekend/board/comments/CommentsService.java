package com.project.weekend.board.comments;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CommentsService {
	
	@Inject
	private CommentsDAO commentsDAO;
	
	public int setCommentsWrite(CommentsDTO commentsDTO) throws Exception{
		int res = commentsDAO.setWrite(commentsDTO);
		return res;
	}

}
