package com.project.weekend.board.festi;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class FestiDAO{
	
	@Inject
	private SqlSession SqlSession;
	private static final String NAMESPACE = "FestiMapper.";
	
	public int getNum() throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getNum");
	}

	public int setWrite(FestiDTO festiDTO) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.insert(NAMESPACE+"setWrite", festiDTO);
	}
	
	public List<FestiDTO> getList(PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public int getCount() throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getCount");
	}

}

