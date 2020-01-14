package com.f.dhm.planner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/planner/**")
public class PlannerController {

	@GetMapping("plannerPage")
	public String plannerPage() throws Exception{
		return "planner/plannerPage";
	}
}
