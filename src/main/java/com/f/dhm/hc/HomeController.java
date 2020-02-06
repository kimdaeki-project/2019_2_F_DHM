package com.f.dhm.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.planner.PlannerService;

@Controller
public class HomeController {
	
	@Autowired
	private PlannerService pLservice;
	
	@GetMapping("/")
	public String index() throws Exception{
		ModelAndView mv = new ModelAndView();
		return "index";
	}
	
	@GetMapping("/template/basic")
	public String basic() {
		return "template/basic";
	}
	
	@GetMapping("/gnb/serviceCenter")
	public String serviceCenter() {
		return "gnb/serviceCenter";
	}
}
	
