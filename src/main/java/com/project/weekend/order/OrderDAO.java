package com.project.weekend.order;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.pay.PayVO;

@Repository
public class OrderDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="OrderMapper.";
	
	public int order(PayVO payVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"order", payVO);
	}
	
	public int paymentSuccess(String partner_order_id) throws Exception{
		return sqlSession.update(NAMESPACE+"paymentSuccess", partner_order_id);
	}
	
	public int cancel(String partner_order_id) throws Exception{
		return sqlSession.update(NAMESPACE+"cancel", partner_order_id);
	}
}
