package com.project.weekend.board.files;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FilesDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "FilesMapper.";
	
	public int setWrite(FilesDTO filesDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", filesDTO);
	}
}
