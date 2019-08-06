package com.project.weekend.board.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.board.BoardDAO;
import com.project.weekend.board.BoardDTO;
import com.project.weekend.util.PageMaker;

@Repository
public class NoticeDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "NoticeMapper.";
	
	@Override
	public int setWrite(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(String num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}

	@Override
	public BoardDTO getSelect(String num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public List<BoardDTO> getTopList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getTopList");
	}
	
	public int getTotalCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pageMaker);
	}
	
	public int getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int setHitUpdate(String num) throws Exception{
		return sqlSession.update(NAMESPACE+"setHitUpdate", num);
	}

}
