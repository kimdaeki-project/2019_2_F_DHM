package com.f.dhm.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;

@Controller
@RequestMapping("/schedule/**")
public class ScheduleController {
	

	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private PlannerService plannerService;
	
	@GetMapping("tour")
	public void tourList() throws Exception{
		
	
	}
	
	@GetMapping("type")
	public void type(String type, PlannerVO plannerVO) throws Exception{
		System.out.println("test:"+type);
		plannerService.typeUpdate(type, plannerVO);
		
		System.out.println(plannerVO.getType());
	}
	
	@GetMapping("schedulePage")
	public ModelAndView plannerPage( PlannerVO plannerVO, ScheduleVO scheduleVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PlannerVO> plannerList= plannerService.plannerSelect(plannerVO);
		List<ScheduleVO> ar = scheduleService.scheduleList();
		mv.addObject("planner", plannerList);
		mv.addObject("type", plannerList.get(0).getType());
		mv.addObject("list", ar);
		mv.setViewName("/schedule/schedulePage");
		return mv;
	}
	
	@GetMapping("showList")
	public ModelAndView viewApi() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/schedule/showList");
		return mv;
	}

	
}
