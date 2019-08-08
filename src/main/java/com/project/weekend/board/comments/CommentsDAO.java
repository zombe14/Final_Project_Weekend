package com.project.weekend.board.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class CommentsDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CommentsMapper.";
	
	public int setWrite(CommentsDTO commentsDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", commentsDTO);
	}
	
	public List<CommentsDTO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public int getCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker.getNum());
	}
	
	public int setDelete(int cnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", cnum);
	}

}
