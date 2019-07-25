package com.project.weekend.board.files;

import java.util.List;

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
	
	public int setUpdate(FilesDTO filesDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", filesDTO);
	}
	
	public List<FilesDTO> getList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}
	
	public int setDelete(int fnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", fnum);
	}
	
	public int setDeleteAll(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
}
