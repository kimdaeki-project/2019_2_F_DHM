package com.f.dhm.planner;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/planner/**")
public class PlannerController {

	
	
	@GetMapping("makePlanner")
	public ModelAndView makePlanner() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/planner/makePlanner");
		return mv;
	}
	
	
	@GetMapping("addPlanner")
	public ModelAndView addSch(String cityName, String startDate, String endDate, String count) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("cityName", cityName);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("count", count);
		mv.setViewName("/planner/addPlanner");

		return mv;
	}
	
	
	@PostMapping("makePlanner")
	public ModelAndView makePlanner(List<PlannerVO> list) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
}
