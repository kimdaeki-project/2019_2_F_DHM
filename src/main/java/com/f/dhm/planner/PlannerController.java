package com.f.dhm.planner;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberVO;
import com.f.dhm.schedule.test.XmlService;
import com.f.dhm.wishlist.WishService;
import com.f.dhm.wishlist.WishVO;

@Controller
@RequestMapping("/planner/**")
public class PlannerController {
	@Autowired
	private PlannerService service;
	
	@Autowired
	private XmlService xService;
	
	@Autowired
	private WishService wishService;
	
	@GetMapping("makePlanner")
	public ModelAndView makePlanner() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/planner/makePlanner");
		return mv;
	}
	
	
	@GetMapping("addPlanner")
	public ModelAndView addSch(String cityName, String startDate, String endDate, String count,String arCode) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("cityName", cityName);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("count", count);
		mv.addObject("arCode", arCode);
		mv.setViewName("/planner/addPlanner");

		return mv;
	}
	
	@GetMapping("ifmOpen")
	@ResponseBody
	public ModelAndView ifmOpen(String arCode) throws Exception{
		ModelAndView mv = new ModelAndView();
		int acode = Integer.valueOf(arCode);
		//음식점
		mv.addObject("food", xService.searchTour(acode, 39, "P", 1).getItem());
		//관광
		mv.addObject("tour", xService.searchTour(acode, 12, "P", 1).getItem());
		//문화시설
		mv.addObject("culture", xService.searchTour(acode, 14, "P", 1).getItem());
		//숙박
		mv.addObject("hotel", xService.searchTour(acode, 32, "P", 1).getItem());
		//여행코스
		mv.addObject("course", xService.searchTour(acode, 25, "P", 1).getItem());
		//쇼핑
		mv.addObject("shopping", xService.searchTour(acode, 38, "P", 1).getItem());
		//행사
		mv.addObject("festival", xService.searchTour(acode, 15, "P", 1).getItem());
		//레포츠
		mv.addObject("report", xService.searchTour(acode, 28, "P", 1).getItem());
		mv.addObject("arCode", acode);
		mv.setViewName("/planner/ifmOpen");
		return mv;
	}
	
	
	@PostMapping("makePlanner")
	@ResponseBody
	public int makePlanner(String id, String title, String type, String people, String[] deDate, String[] arDate,
		String[] bak, String[] region, String[] transfer, WishVO wishVO, String title2, String firstimage, String addr1, int arCode,HttpSession session) throws Exception{
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
	         
	         int y = Integer.parseInt(deDate[i].substring(0, 4));
	         int m = Integer.parseInt(deDate[i].substring(5, 7));
	         int d = Integer.parseInt(deDate[i].substring(8));
	         
	         Calendar c = Calendar.getInstance();
	         c.set(y, m-1, d);
	         
	         Date date = new Date(c.getTimeInMillis());
	         
	         vo.setDeDate(date);
	         
	         y = Integer.parseInt(arDate[i].substring(0, 4));
	         m = Integer.parseInt(arDate[i].substring(5, 7));
	         d = Integer.parseInt(arDate[i].substring(8));
	         
	         c.set(y, m-1, d);
	         date = new Date(c.getTimeInMillis());
	         
	         vo.setArDate(date);
	         
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
		
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		id= memberVO.getId();
		
		wishVO.setId(id);
		wishVO.setTitle(title2);
		wishVO.setFirstimage(firstimage);
		wishVO.setAddr1(addr1);
		wishVO.setPlNum(plNum);
		wishVO.setArCode(arCode);
		wishService.wishAdd(wishVO);
		
		
		
		return pList.get(0).getPlNum();
	}
}
