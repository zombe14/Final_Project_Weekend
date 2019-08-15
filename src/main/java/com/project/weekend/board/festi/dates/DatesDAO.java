package com.project.weekend.board.festi.dates;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DatesDAO {
	private static final String NAMESPACE = "DatesMapper.";
	@Inject
	private SqlSession sqlSession;
	
	public int setWrite(DatesDTO datesDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", datesDTO);
	}
	
	public int setSeatUpdate(DatesDTO datesDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setSeatUpdate", datesDTO);
	}
	
	public int setDelete(int dnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", dnum);
	}
	
	public int setUpdate(DatesDTO datesDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", datesDTO);
	}
	
	public DatesDTO getSelect(int dnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", dnum);
	}
	
	public List<DatesDTO> getList(String num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}
}
