package com.project.weekend.pay;

public class PayVO {
	private String cid = "TC0ONETIME";
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private String item_num;
	private String quantity;
	private String total_amount;
	private int tax_free_amount = 0;
	private String tid;
	private String pg_token;
	private int state;
	private String approval_url = "http://211.238.142.25/weekend/pay/paymentSuccess";
	private String cancel_url = "http://211.238.142.25/weekend/pay/paymentCancel";
	private String fail_url = "http://211.238.142.25/weekend/pay/paymentFail";
	private String show_times;
	private String cancel_available_amount;
	
	
	public String getCancel_available_amount() {
		return cancel_available_amount;
	}
	public void setCancel_available_amount(String cancel_available_amount) {
		this.cancel_available_amount = cancel_available_amount;
	}
	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}
	public String getShow_times() {
		return show_times;
	}
	public void setShow_times(String show_times) {
		this.show_times = show_times;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}
	public int getTax_free_amount() {
		return tax_free_amount;
	}
	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getPg_token() {
		return pg_token;
	}
	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getApproval_url() {
		return approval_url;
	}
	public void setApproval_url(String approval_url) {
		this.approval_url = approval_url;
	}
	public String getCancel_url() {
		return cancel_url;
	}
	public void setCancel_url(String cancel_url) {
		this.cancel_url = cancel_url;
	}
	public String getFail_url() {
		return fail_url;
	}
	public void setFail_url(String fail_url) {
		this.fail_url = fail_url;
	}
}
