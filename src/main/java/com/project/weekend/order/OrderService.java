package com.project.weekend.order;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.weekend.pay.PayVO;

@Service
public class OrderService {
	@Inject
	private OrderDAO orderDAO;
	
	public int order(PayVO payVO) throws Exception{
		return orderDAO.order(payVO);
	}
	
	public int paymentSuccess(String partner_order_id) throws Exception{
		return orderDAO.paymentSuccess(partner_order_id);
	}
	
	public int cancel(String partner_order_id) throws Exception{
		return orderDAO.cancel(partner_order_id);
	}
}
