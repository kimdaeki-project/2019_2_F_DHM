package com.f.dhm.hc;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;
import com.f.dhm.funding.FundingService;
import com.f.dhm.funding.FundingVO;
import com.f.dhm.location.LocationService;
import com.f.dhm.location.LocationVO;
import com.f.dhm.planner.MyPlannerVO;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;


@Controller
public class HomeController {
	
	@Autowired
	private LocationService LoService; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FundingService fuService;
	
	@Autowired
	private PlannerService plService;

	@Autowired
	private PlannerService plannerService;
	@Autowired 
	private FundingService fundingService;
	
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
		

		List<MyPlannerVO> plList = plService.plannerAll();
		
		Date d = new Date();
		long dd = d.getTime()-1000*60*60*24;
		
		
		for (MyPlannerVO myPlannerVO : plList) {
			if (dd - myPlannerVO.getMakeDay().getTime() <=0) {
				mv.addObject("newPlanner", plList);
			}
		}
		
		
		List<MyPlannerVO> ar = plannerService.plannerTypeList(plNum);
		List<FundingVO> ar2= fundingService.fundingIndexList();
		
		
		
		
		mv.addObject("fundinglist",ar2);
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
	
	
	@GetMapping("/admin/administer")
	public ModelAndView viewAdmin() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int newMember = 0;
		int newPlanner = 0;
		int newFunding = 0;
		
		List<LocationVO> loList = LoService.selectList();
		List<MemberVO> memList = memberService.allMember();
		
		Date d = new Date();
		long dd = d.getTime()-1000*60*60*24;
		for (MemberVO memberVO : memList) {
			if (dd - memberVO.getJoinDay().getTime() <= 0) {
				newMember++;
			}
		}
		
		List<MyPlannerVO> plList = plService.plannerAll();
		
		for (MyPlannerVO myPlannerVO : plList) {
			if (dd - myPlannerVO.getMakeDay().getTime() <=0) {
				newPlanner++;
			}
		}
		List<FundingVO> fuList = fuService.allList();
		
		for (FundingVO fundingVO : fuList) {
			if (dd - fundingVO.getRegDate().getTime() <= 0) {
				newFunding++;
			}
		}
		
		
		mv.addObject("Lolist", loList);
		mv.addObject("memList", memList);
		mv.addObject("plList", plList);
		mv.addObject("fuList", fuList);
		
		mv.addObject("newM", newMember);
		mv.addObject("newP", newPlanner);
		mv.addObject("newF", newFunding);
		
		return mv;
	}
}
	
