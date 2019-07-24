package com.project.weekend.file;

import org.apache.ibatis.session.SqlSession;

import com.project.weekend.member.MemberDTO;

public class MemberFileDAO {
	
	private SqlSession sqlSession;
	private static final String NAMESPACE="MemberFileMapper";
	
	public int setWrite(MemberFileVO memberFileVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setWrite", memberFileVO);
	}
	public MemberFileVO getSelect(MemberDTO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberVO);
	}
}
