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
	// 관리자;
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
	// 마이페이지;
	// 내 정보 수정;
	public int setUpdateMy(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateMy", memberDTO);
	}
	// 닉네임 중복 확인(택수씨 코드 사용);
	// 전화번호 중복 확인;
	public int getSelectPhoneMy(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelectPhoneMy", memberDTO);
	}
	// 이메일 중복 확인
	public int getSelectEmailMy(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelectEmailMy", memberDTO);
	}
	// 이메일 인증(택수씨 코드 사용);
	// 비밀번호 수정;
	public int getUpdateCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getUpdateCheck", memberDTO);
	}
	public int setUpdatePs(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdatePs", memberDTO);
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
	public MemberDTO getSelectOverlap(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelectOverlap", memberDTO);
	}
	public MemberDTO getSelectGrade(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelectGrade", memberDTO);
	}
	public MemberDTO getSelectEmail(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelectEmail", memberDTO);
	}
	public MemberDTO getjumin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getjumin", memberDTO);
	}
}
