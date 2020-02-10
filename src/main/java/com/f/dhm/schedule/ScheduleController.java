package com.f.dhm.schedule;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberVO;
import com.f.dhm.planner.PlannerCommentVO2;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;
import com.f.dhm.schedule.test.Items;
import com.f.dhm.schedule.test.XmlService;
import com.f.dhm.wishlist.WishService;
import com.f.dhm.wishlist.WishVO;

@Controller
@RequestMapping("/schedule/**")
public class ScheduleController {
	

	@Autowired
	private ScheduleService scheduleService;
	private PlannerService plannerService;
	@Autowired 
	private XmlService xmlService;
	@Autowired
	private WishService wishService;

	@GetMapping("tour")
	public void addSC(String title, String firstimage) throws Exception{
		
		System.out.println(title);
	
	}
	
	@GetMapping("type")
	public void type(String type, int plNum, HttpSession session) throws Exception{
		plannerService.typeUpdate(type,session, plNum);
	}
	

	@GetMapping("addSchedule")
	public ModelAndView plannerPage(String scName, Integer cost, Integer start, String title, Integer plNum, Integer arCode) throws Exception{
		System.out.println(scName);
		//int plNum = plannerService.getPlnum();
		ModelAndView mv = new ModelAndView();
		//System.out.println("pldfsdfsdf:"+plNum);
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setPlNum(plNum);
		scheduleVO.setScName(scName);
		scheduleVO.setCost(cost);
		scheduleVO.setStart(start);
		scheduleVO.setTour(title);
		scheduleVO.setArCode(arCode);
		scheduleService.scheduleInsert(scheduleVO);
		mv.setViewName("/schedule/schedulePage2");
		
		return mv;
	}
	
	
	
	@GetMapping("schedulePage")
	public ModelAndView plannerPage( PlannerVO plannerVO, ScheduleVO scheduleVO,HttpSession session,int plNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		List<PlannerVO> plannerList= plannerService.plannerSelect(plNum,session);
		List<ScheduleVO> scheduleList = scheduleService.scheduleList(plNum);
		List<WishVO> wishlist = wishService.myWish(session, plNum);
		
		
		String plannerTitle = plannerService.plannerTitle(plNum);
		String plannerType = plannerService.plannerType(plNum);
		int days= plannerService.days(plNum);
		Date deDate = plannerList.get(0).getDeDate();
		//scheduleService.findDay(deDate);
		//Items ar2=xmlService.parseTour();
		Items ar2=xmlService.searchTour(1, 39, "P", 1);;
		
		if(wishlist!=null) {
			mv.addObject("wishlist",wishlist);
		}
		
		
		
		//음식점
		mv.addObject("food", xmlService.searchTour(1, 39, "P", 1).getItem());
		mv.addObject("plannerTitle", plannerTitle);
		mv.addObject("plannerType", plannerType);
		mv.addObject("planner", plannerList);
		mv.addObject("plNum", plNum);
		mv.addObject("dDate", deDate);
		mv.addObject("schedule", scheduleList);
		mv.addObject("days", days);
		mv.setViewName("/schedule/schedulePage2");
		return mv;
	}
	
	@GetMapping("showList")
	public ModelAndView viewApi() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/schedule/showList");
		return mv;
	}

	
}
