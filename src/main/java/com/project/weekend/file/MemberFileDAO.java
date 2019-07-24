package com.project.weekend.file;

import org.apache.ibatis.session.SqlSession;

import com.project.member.MemberDTO;


public class MemberFileDAO {
	
	private SqlSession sqlSession;
	private static final String NAMESPACE="MemberFileMapper";
	
	public int setWrite(MemberFileDTO memberFileDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setWrite", memberFileDTO);
	}
	public MemberFileDTO getSelect(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberDTO);
	}
}
