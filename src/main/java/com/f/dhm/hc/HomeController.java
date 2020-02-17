package com.f.dhm.hc;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;


import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;
import com.f.dhm.commonnotice.CommonService;
import com.f.dhm.commonnotice.CommonVO;
import com.f.dhm.funding.FundingService;
import com.f.dhm.funding.FundingVO;
import com.f.dhm.location.LocationService;
import com.f.dhm.location.LocationVO;
import com.f.dhm.planner.MyPlannerVO;
import com.f.dhm.planner.PlannerCommentVO;
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
	

	@Autowired
	private CommonService commonService;

	
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
		List<PlannerCommentVO> commentVOs=plannerService.getCommentsOrderByRegDateDesc();
		ModelAndView mv = new ModelAndView();
		int plannerCount = plannerService.plannerCount();
		

		List<MyPlannerVO> plList = plService.plannerAll();
		
		Date d = new Date();
		//이틀전추가된 플래너까지
		long dd = d.getTime()-1000*60*60*24*2;
		List<MyPlannerVO> newPlanner = new ArrayList<MyPlannerVO>();
		

		List<Date> deDate = new ArrayList<Date>();
		List<Integer> bak = new ArrayList<Integer>();
		List<Integer> dDay = new ArrayList<Integer>();
		long cd = new Date().getTime();
		for (MyPlannerVO myPlannerVO : plList) {
			if (dd - myPlannerVO.getMakeDay().getTime() <=0) {
				newPlanner.add(myPlannerVO);
				Date ddd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
				deDate.add(ddd);
				bak.add(plService.days(myPlannerVO.getPlNum()));
				dDay.add((int)((cd - ddd.getTime()) / 1000/60/60/24));
			}
		}

		mv.addObject("dDay", dDay);
		mv.addObject("deDate", deDate);
		mv.addObject("bak", bak);
		mv.addObject("newPlanner", newPlanner);
		
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
		mv.setViewName("index");
		mv.addObject("commentVOs", commentVOs);
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
		int newAdvertise = 0;
		List<Integer> howMany = new ArrayList<Integer>();
		
		List<LocationVO> loList = LoService.selectList();
		List<MemberVO> memList = memberService.allMember();
		
		Date d = new Date();
		long dd = d.getTime()-1000*60*60*24;
		for (MemberVO memberVO : memList) {
			if (dd - memberVO.getJoinDay().getTime() <= 0) {
				newMember++;
			}
			
			howMany.add(plService.plannerEq(memberVO.getId()).size());
			
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
		
		List<CommonVO> adList = commonService.getAdverList();
		
		for (CommonVO commonVO : adList) {
			if (dd - commonVO.getCoMakeDay().getTime() <= 0) {
				newAdvertise++;
			}
		}
		
		mv.addObject("Lolist", loList);
		mv.addObject("memList", memList);
		mv.addObject("plList", plList);
		mv.addObject("fuList", fuList);
		mv.addObject("howMany", howMany);
		mv.addObject("adList", adList);
		
		mv.addObject("newA", newAdvertise);
		mv.addObject("newM", newMember);
		mv.addObject("newP", newPlanner);
		mv.addObject("newF", newFunding);
		
		return mv;
	}
	
	@PostMapping("/admin/memberDel")
	@ResponseBody
	public boolean memberDel(String id) throws Exception{
		return memberService.memberDel(id);
	}
	
	@PostMapping("typeList")
		public ModelAndView typeList(int type) throws Exception{
		
		
			ModelAndView mv = new ModelAndView();
			List<MyPlannerVO> typeList = new ArrayList<MyPlannerVO>();
			List<MyPlannerVO> list = plService.plannerAll();
			List<Date> deDate = new ArrayList<Date>();
			List<Integer> bak = new ArrayList<Integer>();
			List<Integer> dDay = new ArrayList<Integer>();
			long d = new Date().getTime();
			
			
				switch (type) {
				case 1:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("아이들과")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 2:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("커플/신혼")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
							
						}
					}			
					break;
				case 3:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("부모님과")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 4:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("남자혼자")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 5:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("여자혼자")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 6:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("여자끼리")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 7:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("남자끼리")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 8:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("남녀함께")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				case 9:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("부모님끼리")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				default:
					for (MyPlannerVO myPlannerVO : list) {
						if (myPlannerVO.getType().equals("타입선택")) {
							typeList.add(myPlannerVO);
							Date dd = plService.plannerSelectIndex(myPlannerVO.getPlNum()).get(0).getDeDate();
							dDay.add((int)((d - dd.getTime()) / 1000/60/60/24));
							deDate.add(dd);
							bak.add(plService.days(myPlannerVO.getPlNum()));
						}
					}
					break;
				}
				mv.addObject("typeList", typeList);
				mv.addObject("cat", type);
				mv.addObject("dDay", dDay);
				mv.addObject("deDate", deDate);
				mv.addObject("bak", bak);
				mv.setViewName("planner/plannerAjax");
			
			return mv;
			
		}
	
}
	
