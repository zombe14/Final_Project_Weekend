package com.project.weekend.file;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class FileDAO {
	
	private SqlSession sqlSession;
	private static final String NAMESPACE="FileMapper";
	
	public int setWrite(List<FileVO> files) throws Exception{
		for(FileVO f:files) {
			System.out.println(f.getNum());
			System.out.println(f.getFname());
			System.out.println(f.getOname());
		}
		int res = sqlSession.insert(NAMESPACE+"setWrite", files);
		return res;
	}
	public int setUpdate(FileVO fileVO) throws Exception{
		int res = sqlSession.update(NAMESPACE+"setUpdate", fileVO);
		return res;
	}
	
	public int setDelete(int fnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"selectDelete", fnum);
	}
	
	public int setDeleteAll(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"selectDeleteAll", num);
	}
	
	public FileVO getSelect(int fnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
	
	public List<FileVO> getList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}

}
