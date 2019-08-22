package com.project.weekend.pay;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class PayDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="PayMapper.";
	
	public int payment(PayVO payVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"payment", payVO);
	}
	
	public int updateToken(PayVO payVO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateToken", payVO);
	}
	
	public PayVO selectOne(String partner_order_id) throws Exception{
		PayVO payVO = new PayVO();
		payVO = sqlSession.selectOne(NAMESPACE+"selectOne", partner_order_id);
		return payVO;
	}
	
	public List<PayVO> selectList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	public int paymentCancel(String partner_order_id) throws Exception{
		return sqlSession.update(NAMESPACE+"cancel", partner_order_id);
	}
	// 상혁
	public int getCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount");
	}
	public List<PayVO> selectAdminList(HttpSession session, PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectAdminList", pageMaker);
	}
}
