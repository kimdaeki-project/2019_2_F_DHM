package com.f.dhm.schedule;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;
import com.f.dhm.schedule.test.Item;
import com.f.dhm.schedule.test.Items;
import com.f.dhm.schedule.test.XmlService;

@Controller
@RequestMapping("/schedule/**")
public class ScheduleController {
	

	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private PlannerService plannerService;
	@Autowired 
	private XmlService xmlService;
	
	
	@GetMapping("tour")
	public void tourList(String title, String firstimage) throws Exception{
		
		System.out.println(title);
	
	}
	
	@GetMapping("type")
	public void type(String type, PlannerVO plannerVO) throws Exception{
		plannerService.typeUpdate(type, plannerVO);
	}
	
	@GetMapping("schedulePage")
	public ModelAndView plannerPage( PlannerVO plannerVO, ScheduleVO scheduleVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PlannerVO> plannerList= plannerService.plannerSelect(plannerVO);
		List<ScheduleVO> ar = scheduleService.scheduleList();

		Date deDate = plannerList.get(0).getDeDate();
	//scheduleService.findDay(deDate);
		Items ar2=xmlService.parseTour();
		System.out.println("///////////////////////");
		for (Item item : ar2.getItem()) {
			System.out.println("title = "+item.getTitle());
			System.out.println("addr1 = "+item.getAddr1());
			System.out.println("image = "+item.getFirstimage());
			System.out.println("area = "+item.getAreacode());
		}
		
		mv.addObject("planner", plannerList);
		mv.addObject("type", plannerList.get(0).getType());
		mv.addObject("dDate", deDate);
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
