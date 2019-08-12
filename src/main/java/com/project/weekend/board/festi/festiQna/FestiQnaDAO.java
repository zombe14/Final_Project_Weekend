package com.project.weekend.board.festi.festiQna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class FestiQnaDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "FestiQnaMapper.";
	
	public int getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int setWrite(FestiQnaDTO festiQnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", festiQnaDTO);
	}
	
	public int setUpdate(FestiQnaDTO festiQnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", festiQnaDTO);
	}
	
	public int setDelete(String qnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", qnum);
	}
	
	public int setDeleteOrigin(String num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteOrigin", num);
	}
	
	public int setDeleteAll(String num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
	
	public FestiQnaDTO getSelect(String qnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", qnum);
	}
	
	public int getCount(String num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", num);
	}
	
	public List<FestiQnaDTO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
}
