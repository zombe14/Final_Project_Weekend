package com.project.weekend;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.weekend.member.MemberDTO;
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
	public String orderRequest(PayVO payVO, HttpSession session) throws Exception{
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		payVO.setPartner_user_id(dto.getId());
		session.setAttribute("vo", payVO);
		return "./pay/payment";
	}

	@RequestMapping(value = "payment")
	public String payment(HttpSession session) throws Exception{
		char ch = (char) ((Math.random()*26) + 65);
		Calendar calendar = Calendar.getInstance();
		String partner_order_id = ch + "" + calendar.getTimeInMillis();
		PayVO payVO = (PayVO)session.getAttribute("vo");
		payVO.setPartner_order_id(partner_order_id);
		String next_redirect_url = payService.payment(payVO);
		orderService.order(payVO);

		session.setAttribute("url", next_redirect_url);
		
		return "./pay/payment";
	}
	
	@RequestMapping(value = "paymentRequest")
	public String paymentRequest(HttpSession session) throws Exception{
		return "./pay/paymentRequest";
	}

	@RequestMapping(value = "approval")
	public String paymentApproval(HttpSession session) throws Exception{
		PayVO payVO = (PayVO) session.getAttribute("vo");
		payVO.setPg_token(session.getAttribute("token").toString());
		String message = null;
		int result = payService.updateToken(payVO);
		if(result != 0) {
			String response = payService.paymentApproval(payVO);
			if(response.equals("Approval Success!")) {
				orderService.paymentSuccess(payVO.getPartner_order_id());
				return "./pay/paymentComplate";
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