package com.project.weekend.member;

import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="MemberMapper.";
	// 상혁;
	// 리스트;
	public List<MemberDTO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	public int getTotalCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pageMaker);
	}
	// 등급 업;
	public int setUpdateP(String id) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateP", id);
	}
	// 등급 다운;
	public int setUpdateM(String id) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateM", id);
	}
	// 회원 삭제;
	public int setDelete(String id)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteA", id);
	}
	// 상혁 끝;
	
	public MemberDTO getNickname(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNickname", memberDTO);
	}
	
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
	public int setUpdateoverlap(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateoverlap", memberDTO);
	}
	public MemberDTO getSelect(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", memberDTO);
	}
	public MemberDTO getSelectCount(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelctCount", memberDTO);
	}
}
