package com.project.weekend.board.commu;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class CommuDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CommuMapper.";
	
	public int setWrite(CommuDTO commuDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", commuDTO);
	}
	
	public int getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int setUpdate(CommuDTO commuDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", commuDTO);
	}
	
	public int setDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}
	
	public int getCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	public CommuDTO getSelect(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	public List<CommuDTO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
}