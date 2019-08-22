package com.project.weekend.pay;

import java.io.IOException;
import java.net.URI;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.project.weekend.util.PageMaker;

@Service
public class PayService implements ResponseErrorHandler{
	private static final String HOST = "https://kapi.kakao.com";
	
	@Inject
	private PayDAO payDAO;
	
	//결제 준비
	@ResponseBody
	public String payment(PayVO payVO) throws Exception{
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KakaoAK 5b6404f298695c304ae950cb9156ba35");
		headers.add("Accept",MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8");
		headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", payVO.getCid());
		params.add("partner_order_id", payVO.getPartner_order_id());
		params.add("partner_user_id", payVO.getPartner_user_id());
		params.add("item_name", payVO.getItem_name());
		params.add("quantity", payVO.getQuantity());
		params.add("total_amount", payVO.getTotal_amount());
		params.add("tax_free_amount", Integer.toString(payVO.getTax_free_amount()));
		params.add("approval_url", payVO.getApproval_url());
		params.add("cancel_url", payVO.getCancel_url());
		params.add("fail_url", payVO.getFail_url());
		
		HttpEntity<MultiValueMap<String, String>> body = new
				HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		String response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, String.class);
		String next_redirect_pc_url = null;
		if(response != null) {
			JSONParser jsonParser = new JSONParser();
			JSONObject js = (JSONObject)jsonParser.parse(response);
			payVO.setTid(js.get("tid").toString());
			next_redirect_pc_url = js.get("next_redirect_pc_url").toString();
			int result = payDAO.payment(payVO);
			if(result == 0) {
				return "redirect: ../";
			}
		}
		return next_redirect_pc_url;
	}
	
	//결제 승인
	@ResponseBody
	public String paymentApproval(PayVO payVO) throws Exception{
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setErrorHandler(new PayService());
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KakaoAK 5b6404f298695c304ae950cb9156ba35");
		headers.add("Accept",MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8");
		headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", payVO.getCid());
		params.add("tid", payVO.getTid());
		params.add("partner_order_id", payVO.getPartner_order_id());
		params.add("partner_user_id", payVO.getPartner_user_id());
		params.add("pg_token", payVO.getPg_token());
		
		HttpEntity<MultiValueMap<String, String>> body = new
				HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		String response = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, String.class);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject js = (JSONObject)jsonParser.parse(response);
		if(js.get("aid").toString() != null) {
			response = "Approval Success!";
		}else {
			response = js.get("method_result_message").toString();
		}
		
		return response;
	}
	
	public int updateToken(PayVO payVO) throws Exception{
		return payDAO.updateToken(payVO);
	}
	
	public PayVO selectOne(String partner_order_id) throws Exception{
		PayVO payVO = new PayVO();
		payVO = payDAO.selectOne(partner_order_id);
		return payVO;
	}
	
	public List<PayVO> selectList() throws Exception{
		return payDAO.selectList();
	}
	
	public int paymentCancel(PayVO payVO) throws Exception{
		int result = 0;
		
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setErrorHandler(new PayService());
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KakaoAK 5b6404f298695c304ae950cb9156ba35");
		headers.add("Accept",MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8");
		headers.add("Content-Type",MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", payVO.getCid());
		params.add("tid", payVO.getTid());
		params.add("cancel_amount", payVO.getTotal_amount());
		params.add("cancel_tax_free_amount", "0");
		
		HttpEntity<MultiValueMap<String, String>> body = new
				HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		String response = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, String.class);
		System.out.println(response);
			JSONParser jsonParser = new JSONParser();
			JSONObject js = (JSONObject)jsonParser.parse(response);
			String str = js.get("aid").toString();
			if(str != null) {
				result = payDAO.paymentCancel(payVO.getPartner_order_id());
			}
		
		return result;
	}

	@Override
	public boolean hasError(ClientHttpResponse response) throws IOException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void handleError(ClientHttpResponse response) throws IOException {
		// TODO Auto-generated method stub
		
	}
	// 상혁
	public List<PayVO> selectAllList(HttpSession session ,PageMaker pageMaker) throws Exception{
		int totalCount = payDAO.getCount();
		pageMaker.makeRow();
		List<PayVO> list = payDAO.selectAllList(session, pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
}
