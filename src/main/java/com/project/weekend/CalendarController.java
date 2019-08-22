package com.project.weekend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar/")
public class CalendarController {

	@RequestMapping(value = "calendar")
	public void calendar() {}
}
