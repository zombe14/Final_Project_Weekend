package com.project.weekend;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/footer/")
public class FooterController {

	@RequestMapping(value = "introduction", method = RequestMethod.GET )
	public void introductionSelect()throws Exception{}
	@RequestMapping(value = "personalInformation", method = RequestMethod.GET)
	public void personalInformationSelect()throws Exception{}
	@RequestMapping(value = "use", method = RequestMethod.GET)
	public void useSelect()throws Exception{}
	@RequestMapping(value = "youth", method = RequestMethod.GET)
	public void youthSelect()throws Exception{}
}
