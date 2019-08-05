package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/callcenter/")
public class CallCenterController {
	
	@RequestMapping(value = "main")
	public void mainSelect(){}
	@RequestMapping(value = "ticketguide")
	public void ticketguideSelect() {}
	@RequestMapping(value = "cancel")
	public void cancel() {}
}