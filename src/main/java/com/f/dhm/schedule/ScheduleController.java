package com.f.dhm.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;
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
	@Autowired
	private PlannerService plannerService;
	@Autowired
	private XmlService xmlService;
	@Autowired
	private WishService wishService;
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("scDelete")
	public void scDelete(Integer plNum, HttpSession session) throws Exception{
		MemberVO memberVO=(MemberVO) session.getAttribute("member");

		plannerService.plannerDel(memberVO.getId(), plNum);

	}
	

	@GetMapping("type")
	public void type(String type, int plNum, HttpSession session) throws Exception {
		plannerService.typeUpdate(type, session, plNum);
	}
	
	@GetMapping("mySc")
	public ModelAndView mySc(String scName,Integer plNum,ScheduleInfoVO scheduleInfoVO) throws Exception{
		 ModelAndView mv = new ModelAndView();
		for(int i=0; i<scheduleInfoVO.getScName().length() ;i++) {
			String sn = scheduleInfoVO.getScName();
			if(scName==sn) {
				
				scheduleInfoVO.getScName();
				scheduleInfoVO.getAddr1();
				scheduleInfoVO.getFirstimage();
				scheduleInfoVO.getCost();
		//		scheduleInfoVO.getStart();
				scheduleInfoVO.getTitle();
				 mv.addObject("scInfo",scheduleInfoVO); 
			}
		}
		
		
		mv.setViewName("schedule/schedulePage2");
		return mv;
	}
	

	@GetMapping("addSchedule")
	@ResponseBody
	public Integer plannerPage(String scName, Integer cost, Integer start, String title, Integer plNum,
			Integer arCode) throws Exception {
		
		boolean check=false;
		int flag=0;
		String msg="";
		ModelAndView mv = new ModelAndView();
		List<ScheduleVO> ar = scheduleService.scheduleCheck(plNum, title);
		System.out.println("sinsnsndklfsdlkjfkls    :    "+ar.size());
	
			
			if(ar.size()==0) {
	
				ScheduleVO scheduleVO = new ScheduleVO();
				scheduleVO.setPlNum(plNum);
				scheduleVO.setScName(scName);
				scheduleVO.setCost(cost);
				scheduleVO.setStart(start);
				scheduleVO.setTour(title);
				scheduleVO.setArCode(arCode);
				
				check = scheduleService.scheduleInsert(scheduleVO);
			
				if(check==true) {
					flag=1;
				}
			}
	
			
			mv.setViewName("schedulePage2");
		
		

		return flag;
	}

	public void sc() throws Exception{
		
	}
	
	@GetMapping("schedulePage")
	public ModelAndView plannerPage(PlannerVO plannerVO, ScheduleVO scheduleVO, HttpSession session, int plNum, String scName)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		

		List<PlannerVO> plannerList = plannerService.plannerSelect(plNum, session);

		int bak=0;
		Date d=new Date();
		
		List<Date> ddd= new ArrayList<Date>(); 
	     
		
		for (int i = 0; i < plannerList.size(); i++) {
			
			bak = plannerList.get(i).getBak();
			mv.addObject("bak", bak);
			d = plannerList.get(i).getDeDate();
			mv.addObject("deDate", d);
			ddd.add(d);
			if(bak>0) {
				for(int j=0;j<bak;j++) {
					
					long dd = d.getTime()+1000*60*60*24;
					d.setTime(dd);
					 ddd.add(d);
					 
					 mv.addObject("deDate", ddd);
				}
			}
		}
		
		
		List<ScheduleVO> scheduleList = scheduleService.scheduleList(plNum);
		List<WishVO> wishlist = wishService.myWish(session, plNum);
		
		
		if(memberVO==null) {
			String msg="로그인이 필요합니다.";
			mv.addObject("message",msg);
			mv.addObject("path","../member/memberLogin");
			mv.setViewName("common/result");
			
		}else if(plannerList.get(0).getId().equals(memberVO.getId())) {
			
			
			List<ScheduleInfoVO> scheduleInfoVOs = new ArrayList<ScheduleInfoVO>();
			ScheduleInfoVO scheduleInfoVO =null;
			
			for(int i=0; i<scheduleList.size();i++) {
				
				String tour = scheduleList.get(i).getTour();
				System.out.println("tour    :    " +tour);
				Map<String, Object> scInfo = scheduleService.scheduleInfo(tour, plNum);
				scheduleInfoVO = new ScheduleInfoVO();
				scheduleInfoVO.setTitle((String)scInfo.get("title"));
				scheduleInfoVO.setAddr1((String)scInfo.get("addr1"));
				scheduleInfoVO.setCost((Integer)scInfo.get("cost"));
				scheduleInfoVO.setFirstimage((String)scInfo.get("firstimage"));
				scheduleInfoVO.setStart((Integer)scInfo.get("start"));
				scheduleInfoVO.setTour((String)scInfo.get("tour"));
				scheduleInfoVO.setArCode((Integer)scInfo.get("arCode"));
				scheduleInfoVO.setScName((String)scInfo.get("scName"));
				scheduleInfoVOs.add(scheduleInfoVO);
				System.out.println("arCodeTest    :   "+scheduleInfoVO.getArCode());
			}
			
			mv.addObject("scheduleInfo", scheduleInfoVOs);
			
			String plannerTitle = plannerService.plannerTitle(plNum);
			String plannerType = plannerService.plannerType(plNum);
			int days = plannerService.days(plNum);
			Date deDate = plannerList.get(0).getDeDate();
			// scheduleService.findDay(deDate);
			// Items ar2=xmlService.parseTour();
			Items ar2 = xmlService.searchTour(1, 39, "P", 1);
			
			
			if (wishlist != null) {
				mv.addObject("wishlist", wishlist);
			}
			
			// 음식점
			mv.addObject("food", xmlService.searchTour(1, 39, "P", 1).getItem());
			mv.addObject("plannerTitle", plannerTitle);
			mv.addObject("plannerType", plannerType);
			mv.addObject("planner", plannerList);
			mv.addObject("plNum", plNum);
			mv.addObject("dDate", deDate);
			mv.addObject("schedule", scheduleList);
			mv.addObject("days", days);
			mv.setViewName("/schedule/schedulePage2");
			
		}else if(plannerList.size()==0){
			String msg="다른사람의 플래너는 열람할 수 없습니다.";
			mv.addObject("message",msg);
			mv.addObject("path","../");
			mv.setViewName("common/result");
		}
		
	
		return mv;
	}

	@GetMapping("showList")
	public ModelAndView viewApi() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/schedule/showList");
		return mv;
	}

}
