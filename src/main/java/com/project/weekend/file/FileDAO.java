package com.project.weekend.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="FileMapper.";
	
	public int setWrite(FileDTO fileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", fileDTO);
	}
	
	public int setDelete(int fnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", fnum);
	}
	
	public int setDeleteAll(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
	
	public FileDTO getSelect(int fnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
	
	public List<FileDTO> getList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}

}
