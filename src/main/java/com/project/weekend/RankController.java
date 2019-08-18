package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/rank/")
public class RankController {

	@RequestMapping(value = "rank_festi1")
	public void rank1() {}
	@RequestMapping(value = "rank_festi2")
	public void rank2() {}
	@RequestMapping(value = "rank_festi3")
	public void rank3() {}
	
	
}
