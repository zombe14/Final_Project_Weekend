package com.project.weekend.member;

import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="MemberMapper.";

	// 상혁;
	public List<MemberDTO> getList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", memberDTO);
	}
	public int setDelete(List<String> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", list);
	}
	// 상혁 끝;
	public MemberDTO getId(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getId", memberDTO);
	}
	public int setWrite(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", memberDTO);
	}
	public int setUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", memberDTO);
	}
	public int setUpdatezero(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdatezero", memberDTO);
	}
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberDTO);
	}
	public MemberDTO getSelectCount(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelctCount", memberDTO);
	}
}
