package com.project.weekend.board.festi.after;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class AfterDAO {

	@Inject
	private SqlSession sqlSession;
	private final static String NAMESPACE = "AfterMapper.";
	
	public int setWrite(AfterDTO afterDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", afterDTO);
	}
	
	public int setDelete(String anum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", anum);
	}
	
	public int setDeleteAll(String num) throws Exception{
		System.out.println("a dao : "+num);
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
	
	public int setUpdate(AfterDTO afterDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", afterDTO);
	}
	
	public int getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public AfterDTO getSelect(String anum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", anum);
	}
	
	public int getCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	public int getCountAll(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCountAll", pageMaker);
	}

	public List<AfterDTO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public List<AfterDTO> getAllList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAllList", pageMaker);
	}
	
	public int setHitUpdate(String anum) throws Exception{
		return sqlSession.update(NAMESPACE+"setHitUpdate", anum);
	}
	
	public List<String> getListNum (String num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getListNum", num);
	}
}
