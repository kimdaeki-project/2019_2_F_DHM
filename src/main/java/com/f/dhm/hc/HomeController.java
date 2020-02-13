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
import com.f.dhm.schedule.test.XmlService;


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
	@Autowired
	private XmlService xmlService;
	
	  @GetMapping("mapTestindex")
	   public ModelAndView mapTest(int plNum, HttpSession session) throws Exception{
	      
	      ModelAndView mv = new ModelAndView();
	      
	      List<PlannerVO> list = plannerService.plannerSelectIndex(plNum);
	      List<Integer> polyPath = new ArrayList<Integer>();
	      for (PlannerVO plannerVO : list) {
	         polyPath.add(plannerVO.getPolyPath());
	      }
	      mv.addObject("pp", polyPath);
	      
	      return mv;
	      
	   }
	
	@GetMapping("/")
	public ModelAndView index(Integer plNum, Integer acode) throws Exception{
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
		
	
		mv.addObject("festival_seoul", xmlService.searchTour(1, 15, "P", 1).getItem());
		mv.addObject("festival_incheon", xmlService.searchTour(2, 15, "P", 1).getItem());
		mv.addObject("festival_daegu", xmlService.searchTour(4, 15, "P", 1).getItem());
		mv.addObject("festival_gangwon", xmlService.searchTour(32, 15, "P", 1).getItem());
		mv.addObject("festival_busan", xmlService.searchTour(6, 15, "P", 1).getItem());
		mv.addObject("festival_kyungi", xmlService.searchTour(31, 15, "P", 1).getItem());
		mv.addObject("festival_jeju", xmlService.searchTour(39, 15, "P", 1).getItem());
		mv.addObject("festival_jrbd", xmlService.searchTour(37, 15, "P", 1).getItem());
		
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
	
