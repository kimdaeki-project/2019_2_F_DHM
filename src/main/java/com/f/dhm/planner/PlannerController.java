package com.f.dhm.planner;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/planner/**")
public class PlannerController {
	@Autowired
	private PlannerService service;
	
	
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
	@ResponseBody
	public int makePlanner(String id, String title, String type, String people, String[] deDate, String[] arDate,
		String[] bak, String[] region, String[] transfer) throws Exception{
		List<PlannerVO> pList = new ArrayList<PlannerVO>();
		
		int plNum = service.getPlnum();
		
		System.out.println("id = "+ id);
		System.out.println("title = "+ title);
		System.out.println("type = "+ type);
		System.out.println("people = "+people);
		System.out.println("dD length = "+deDate[0]);
		System.out.println("aD length = "+arDate[0]);
		System.out.println("bak length = "+bak[0]);
		System.out.println("region length = "+region[0]);
		System.out.println("trans length = "+transfer[0]);
		
		
		for (int i = 0; i < deDate.length; i++) {
			PlannerVO vo = new PlannerVO();
			vo.setPlNum(plNum);
			vo.setId(id);
			vo.setTitle(title);
			vo.setType(type);
			people = people.replaceAll("명", "");
			vo.setPeople(Integer.valueOf(people));
			vo.setDeDate(deDate[i]);
			vo.setArDate(arDate[i]);
			vo.setBak(Integer.valueOf(bak[i]));
			vo.setRegion(region[i]);
			if (i < deDate.length-1) {				
				vo.setTransfer(transfer[i]);
			}
			pList.add(vo);
		}
		int check = 0;
		for (PlannerVO plannerVO : pList) {
			System.out.println(plannerVO);
		}
		service.saveList(pList);
		
		return pList.get(0).getPlNum();
	}
}
