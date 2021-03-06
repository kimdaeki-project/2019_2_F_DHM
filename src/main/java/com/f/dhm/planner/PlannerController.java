package com.f.dhm.planner;

import java.sql.Date;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.f.dhm.Member.MemberVO;
import com.f.dhm.location.LocationService;
import com.f.dhm.location.LocationVO;
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
	

	@Autowired
	private LocationService LoService;

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
	      
	      List<java.util.Date> deDate = new ArrayList<java.util.Date>();
	      
	      //D-day 계산
	      List<String> leftDay = new ArrayList<>();
	      
	      long today = Calendar.getInstance().getTimeInMillis();
	      
	      for (int i = 0; i < ar.size(); i++) {
	         List<PlannerVO> list = service.plannerSelect(ar.get(i).getPlNum(), session);
	         deDate.add(service.plannerSelectIndex(list.get(0).getPlNum()).get(0).getDeDate());
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
	      mv.addObject("deDate", deDate);
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
		      String[] addr1, int[] arCode,HttpSession session, int[] pp, int[] arCodeP, Integer plNum, String email,Integer plLock) throws Exception{
		      
			List<PlannerVO> pList = new ArrayList<PlannerVO>();
		      
		      if (plNum != null) {         
		         service.plannerDel(id, plNum);
		      }
		      
		      plNum = service.getPlnum();
		      if (plLock == null) {
				plLock = 0;
			}
		      
		      for (int i = 0; i < deDate.length; i++) {

		         PlannerVO vo = new PlannerVO();
		         vo.setPlLock(plLock);
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
		         
		         int tLength = 0; 
		         if (transfer != null) {
		        	 tLength = transfer.length;
				}
		         //도시 정보 추가
		         if (i > 0 && deDate.length > 1 && tLength > 0) {            
		            vo.setTransfer(transfer[i-1]);
		            LoService.updateLoc(arCodeP[i], Integer.parseInt(bak[i]), transfer[i-1]);
		         }else {
		        	LoService.updateLoc(arCodeP[i], Integer.parseInt(bak[i]), "선택"); 
		         }
		         //도시정보추가
		         
		         vo.setPolyPath(pp[i]);
		         vo.setArCode(arCodeP[i]);
		         
		         
		         pList.add(vo);
		      }
		      
		      
		      service.saveList(pList);
		      
		      //////////////////////////////////////////
		      
		      //MemberVO memberVO = (MemberVO)session.getAttribute("member");
		      List<WishVO> wishlist = new ArrayList<WishVO>();
		    
		     if(titleA!=null) { 
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
		     }
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
	      mv.addObject("lock", list.get(0).getPlLock());
	      mv.addObject("pp", polyPath);
	      
	      return mv;
	      
	   }
	  
	  @GetMapping("mapTestindex")
	   public ModelAndView mapTestindex(int plNum) throws Exception{
	      
	      ModelAndView mv = new ModelAndView();
	      
	      List<PlannerVO> list = service.plannerSelectIndex(plNum);
	      List<Integer> polyPath = new ArrayList<Integer>();
	      
	      for (PlannerVO plannerVO : list) {
	         polyPath.add(plannerVO.getPolyPath());
	      }
	      mv.addObject("pp", polyPath);
	      mv.addObject("lock", list.get(0).getPlLock());
	      mv.setViewName("planner/mapTestindex");
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
	

	
	@GetMapping("getPercent")
	@ResponseBody
	public List<Integer> getPercent(int arCode) throws Exception{
		List<Integer> pec = new ArrayList<Integer>();
		
		LocationVO lvo = LoService.selectOne(arCode);
		
		pec.add(lvo.getBak0()*100/lvo.getTotalBak());
		pec.add(lvo.getBak1()*100/lvo.getTotalBak());
		pec.add(lvo.getBak2()*100/lvo.getTotalBak());
		pec.add(lvo.getBak3()*100/lvo.getTotalBak());
		pec.add(lvo.getBak4()*100/lvo.getTotalBak());
		pec.add(lvo.getBak5()*100/lvo.getTotalBak());
		pec.add(lvo.getBak6()*100/lvo.getTotalBak());
		pec.add(lvo.getBak7()*100/lvo.getTotalBak());
		pec.add(lvo.getBak8()*100/lvo.getTotalBak());
		pec.add(lvo.getBak9()*100/lvo.getTotalBak());
		
		return pec;
	}
	

}
