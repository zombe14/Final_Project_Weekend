package com.project.weekend.board.comments;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CommentsMapper.";
	
	public int setWrite(CommentsDTO commentsDTO) throws Exception{
		return sqlSession.insert(NAMESPACE, commentsDTO);
	}

}
