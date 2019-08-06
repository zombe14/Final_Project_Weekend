package com.project.weekend.board.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class QnaDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "QnaMapper.";
	
	public int getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	

	public int setWrite(QnaDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", qnaDTO);
	}

	
	public int setUpdate(QnaDTO qnaDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", qnaDTO);
	}

	
	public int setDelete(String num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}

	
	public QnaDTO getSelect(String num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	public int getCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	public List<QnaDTO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public int setReplyWrite(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setReplyWrite", qnaDTO);
	}
	
	public int setHitUpdate(String num) throws Exception{
		return sqlSession.update(NAMESPACE+"setHitUpdate", num);
	}

}
