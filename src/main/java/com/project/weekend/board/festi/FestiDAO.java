package com.project.weekend.board.festi;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
