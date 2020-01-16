package com.f.dhm.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/schedule/**")
public class ScheduleController {
	
	@GetMapping("showList")
	public ModelAndView viewApi() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/schedule/showList");
		return mv;
	}
	
	@GetMapping("addSchedule")
	public ModelAndView addSch(String cityName, String startDate, String endDate) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("cityName", cityName);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.setViewName("/schedule/addSchedule");
		
		return mv;
	}
}
