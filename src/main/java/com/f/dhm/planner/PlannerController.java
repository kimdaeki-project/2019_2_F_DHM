package com.f.dhm.planner;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
	
	//혜현
	   @GetMapping("myPlanner")
	   public ModelAndView myPlanner(PlannerVO plannerVO, HttpSession session) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      
	      List<Integer> days= new ArrayList<Integer>();
	      
	      List<MyPlannerVO> ar = service.plannerList(plannerVO, session);
	      
	      List<String> ar2 = new ArrayList<String>();
	      
	      //D-day 계산
	      List<String> leftDay = new ArrayList<>();
	      
	      long today = Calendar.getInstance().getTimeInMillis();
	      
	      for (int i = 0; i < ar.size(); i++) {
	         List<PlannerVO> list = service.plannerSelect(ar.get(i).getPlNum(), session);
	         
	         long minus = list.get(0).getDeDate().getTime();
	         long cal = today - minus;
	         cal = cal/1000/60/60/24;
	         if (cal < 0) {
	        	 leftDay.add("<font style=\"color:blue;\">"+"D"+cal+"일전"+"</font>");
				}else if (cal == 0) {
					leftDay.add("<font style=\"color:green; font-weight: bold;\">"+"D-DAY"+"</font>");
				}else {
					 leftDay.add("<font style=\"color:red;\">"+cal+"일 지난 플래너"+"</font>");
				}
	         String path = "";
	         for (int j = 0; j < list.size(); j++) {
	            
	            if (j == 0) {
	               path = list.get(j).getPolyPath().toString();
	            }else {
	               path = path + ", " + list.get(j).getPolyPath();
	            }
	         }
	         
	         path = "["+path+"]";
	         ar2.add(path);
	      }

	      for (int i = 0; i < ar.size(); i++) {
	         int d= service.days(ar.get(i).getPlNum());
	         days.add(d);
	      }
	      mv.addObject("Dday", leftDay);
	      mv.addObject("path", ar2);
	      mv.addObject("list", ar);
	      mv.addObject("days", days);
	      mv.setViewName("planner/myPlanner");
	      
	      return mv;
	   }
	
	@GetMapping("addPlanner")
	public ModelAndView addSch(String cityName, String startDate, String endDate, String count,String arCode,String index) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("cityName", cityName);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.addObject("count", count);
		mv.addObject("arCode", arCode);
		mv.addObject("index", index);
		mv.setViewName("/planner/addPlanner");

		return mv;
	}
	
	@GetMapping("ifmOpen")
	@ResponseBody
	public ModelAndView ifmOpen(String arCode, HttpSession session, PlannerVO plannerVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MyPlannerVO> ar = service.plannerList(plannerVO, session);
		List<WishVO> ar2 =null;
		
		
		for (int i = 0; i < ar.size(); i++) {
			int plNum=ar.get(i).getPlNum();
			ar2 = wishService.myWish(session, plNum);
		}
		
		
		mv.addObject("list", ar2);
		
		
		
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
		      String[] bak, String[] region, String[] transfer, String[] titleA, String[] firstimage, 
		      String[] addr1, int[] arCode,HttpSession session, int[] pp, int[] arCodeP, Integer plNum, String email) throws Exception{
		      List<PlannerVO> pList = new ArrayList<PlannerVO>();
		      
		      
		      if (plNum != null) {         
		         service.plannerDel(id, plNum);
		      }
		      
		      plNum = service.getPlnum();
		      
		      System.out.println("plNum = " + plNum);
		      
		      for (int i = 0; i < deDate.length; i++) {

		         PlannerVO vo = new PlannerVO();
		         vo.setEmail(email);
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
		         if (bak[i].equals("무")) {
		            bak[i] = "0";
		         }
		         vo.setBak(Integer.valueOf(bak[i]));
		         vo.setRegion(region[i]);
		         if (i > 0 && deDate.length > 1) {            
		            vo.setTransfer(transfer[i-1]);
		         }
		         
		         vo.setPolyPath(pp[i]);
		         vo.setArCode(arCodeP[i]);
		         
		         pList.add(vo);
		      }
		      
		      for (PlannerVO plannerVO : pList) {
		         System.out.println(plannerVO);
		      }
		      service.saveList(pList);
		      
		      //////////////////////////////////////////
		      
		      //MemberVO memberVO = (MemberVO)session.getAttribute("member");
		      List<WishVO> wishlist = new ArrayList<WishVO>();
		      
		      //id= memberVO.getId();
		      
		      for(int i=0; i< titleA.length; i++) {
		         WishVO wishVO = new WishVO();
		         wishVO.setId(id);
		         wishVO.setTitle(titleA[i]);
		         wishVO.setFirstimage(firstimage[i]);
		         wishVO.setAddr1(addr1[i]);
		         wishVO.setPlNum(plNum);
		         wishVO.setArCode(arCode[i]);
		         wishlist.add(wishVO);

		      }
		      wishService.wishAdd(wishlist, plNum, title);
		      
		      return pList.get(0).getPlNum();
		   }
	
	
	  @GetMapping("mapTest")
	   public ModelAndView mapTest(int plNum, HttpSession session) throws Exception{
	      
	      ModelAndView mv = new ModelAndView();
	      
	      List<PlannerVO> list = service.plannerSelect(plNum, session);
	      List<Integer> polyPath = new ArrayList<Integer>();
	      for (PlannerVO plannerVO : list) {
	         polyPath.add(plannerVO.getPolyPath());
	      }
	      mv.addObject("pp", polyPath);
	      
	      return mv;
	      
	   }
	
	@GetMapping("updatePlanner")
	public ModelAndView updatePlanner(int plNum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PlannerVO> list = service.plannerSelect(plNum, session);
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("waitAminute")
	public void waiting() {
		
	}
	
}
