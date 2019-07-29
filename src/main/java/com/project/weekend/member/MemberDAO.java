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
	
	// 상혁 test용;
	public List<MemberDTO> getList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", memberDTO);
	}
	
	public MemberDTO getId(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getId", memberDTO);
	}
	
	public int setWrite(MemberDTO memberDTO)throws Exception{
		System.out.println("MEMBERDAO");
		return sqlSession.insert(NAMESPACE+"setWrite", memberDTO);
	}
	
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberDTO);
	}
}
