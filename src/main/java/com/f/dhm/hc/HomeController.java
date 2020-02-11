package com.f.dhm.hc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.planner.MyPlannerVO;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;

@Controller
public class HomeController {

	@Autowired
	private PlannerService plannerService;
	
	  @GetMapping("mapTest")
	   public ModelAndView mapTest(int plNum, HttpSession session) throws Exception{
	      
	      ModelAndView mv = new ModelAndView();
	      
	      List<PlannerVO> list = plannerService.plannerSelect(plNum, session);
	      List<Integer> polyPath = new ArrayList<Integer>();
	      for (PlannerVO plannerVO : list) {
	         polyPath.add(plannerVO.getPolyPath());
	      }
	      mv.addObject("pp", polyPath);
	      
	      return mv;
	      
	   }
	
	@GetMapping("/")
	public ModelAndView index(Integer plNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		int plannerCount = plannerService.plannerCount();
		
		List<MyPlannerVO> ar = plannerService.plannerTypeList(plNum);
		
		
		
		mv.addObject("plannerCount", plannerCount);
		mv.addObject("typelist", ar);
		mv.setViewName("index");

		return mv;
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
	
