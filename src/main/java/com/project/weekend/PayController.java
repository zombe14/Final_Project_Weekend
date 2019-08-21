package com.project.weekend;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.weekend.order.OrderService;
import com.project.weekend.pay.PayService;
import com.project.weekend.pay.PayVO;

@Controller
@RequestMapping(value = "/pay/")
public class PayController {

	@Inject
	private PayService payService;
	@Inject
	private OrderService orderService;

	@RequestMapping(value = "orderRequest")
	public String payment(PayVO payVO, HttpSession session) throws Exception{
		session.setAttribute("vo", payVO);
		return "./pay/payment";
	}

	@RequestMapping(value = "payment")
	public String payment(HttpServletRequest request, PayVO payVO, HttpSession session) throws Exception{

		char ch = (char) ((Math.random()*26) + 65);
		Calendar calendar = Calendar.getInstance();
		String partner_order_id = ch + "" + calendar.getTimeInMillis();

		payVO.setPartner_order_id(partner_order_id);
		payVO.setPartner_user_id(request.getParameter("partner_user_id"));
		payVO.setItem_name(request.getParameter("item_name"));
		payVO.setQuantity(request.getParameter("quantity"));
		payVO.setTotal_amount(request.getParameter("total_amount"));
		payVO.setItem_num(request.getParameter("item_num"));
		payVO.setShow_times(request.getParameter("show_times"));
		
		String next_redirect_url = payService.payment(payVO);
		orderService.order(payVO);

		session.setAttribute("url", next_redirect_url);
		session.setAttribute("order", payVO.getPartner_order_id());
		return "./pay/paymentRequest";
	}

	@RequestMapping(value = "approval")
	public String paymentApproval(@RequestParam("order") String partner_order_id, @RequestParam("token") String pg_token, HttpSession session) throws Exception{
		System.out.println(pg_token);
		System.out.println(partner_order_id);
		String message = null;
		int result = payService.updateToken(partner_order_id, pg_token);
		if(result != 0) {
			PayVO payVO = new PayVO();
			payVO = payService.selectOne(partner_order_id);
			String response = payService.paymentApproval(payVO);
			if(response.equals("Approval Success!")) {
				message = "Payment Success";
				orderService.paymentSuccess(partner_order_id);
			}else {
				message = "Payment Approval Fail";
			}
		}else {
			message = "DB Fail";
		}
		session.setAttribute("message", message);
		session.setAttribute("path", "./paymentList");
		return "common/messageMove";
	}
	
	@RequestMapping("paymentSuccess")
	public String Success(@RequestParam("pg_token") String pg_token, HttpSession session) throws Exception{
		System.out.println("Success");
		session.setAttribute("token", pg_token);
		return "./pay/paymentSuccess";
	}
	
	
	@RequestMapping("paymentList")
	public String selectList(HttpSession session) throws Exception{
		List<PayVO> list = payService.selectList();
		session.setAttribute("list", list);
		return "./pay/paymentList";
	}
	
	@RequestMapping("paymentCancel")
	public String paymentCancel(HttpSession session, @RequestParam("partner_order_id")String partner_order_id) throws Exception{
		PayVO payVO = payService.selectOne(partner_order_id);
		int result = payService.paymentCancel(payVO);
		result = orderService.cancel(partner_order_id);
		String message = "CancelFail";
		if(result !=  0) {
			message = "CancelSuccess";
		}
		session.setAttribute("message", message);
		session.setAttribute("path", "./paymentList");
		return "common/messageMove";
	}

	public String cancel() throws Exception{
		String message = "Payment Cancel";
		return "redirect: ../Message?message="+message;
	}

	public String fail() throws Exception{
		String message = "Payment Fail";
		return "redirect: ../Message?message="+message;
	}

}