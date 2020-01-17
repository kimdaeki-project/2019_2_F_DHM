package com.f.dhm.planner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/planner/**")
public class PlannerController {

	@GetMapping("plannerPage")
	public String plannerPage() throws Exception{
		return "planner/plannerPage";
	}
	
	@GetMapping("makePlanner")
	public ModelAndView makePlanner() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/planner/makePlanner");
		return mv;
	}
	
	
	@GetMapping("addPlanner")
	public ModelAndView addSch(String cityName, String startDate, String endDate, String count) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("cityName", cityName);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("count", count);
		mv.setViewName("/planner/addPlanner");
		
		return mv;
	}
}
