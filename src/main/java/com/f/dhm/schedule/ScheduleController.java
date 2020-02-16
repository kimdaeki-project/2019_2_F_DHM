package com.f.dhm.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

import com.f.dhm.Member.MemberService;
import com.f.dhm.Member.MemberVO;
import com.f.dhm.planner.PlannerCommentVO;
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
      //      scheduleInfoVO.getStart();
            scheduleInfoVO.getTitle();
             mv.addObject("scInfo",scheduleInfoVO); 
         }
      }
      
      
      mv.setViewName("schedule/schedulePage");
      return mv;
   }
   

   @GetMapping("addSchedule")
   @ResponseBody
   public Integer plannerPage(String scName, Integer cost, Integer start,String day ,String title, Integer plNum,
         Integer arCode) throws Exception {

     

      boolean check=false;
      int flag=0;
      String msg="";
      ModelAndView mv = new ModelAndView();
      List<ScheduleVO> ar = scheduleService.scheduleCheck(plNum, title);
         
         if(ar.size()==0) {
   
            ScheduleVO scheduleVO = new ScheduleVO();
            scheduleVO.setPlNum(plNum);
            scheduleVO.setScName(scName);
            scheduleVO.setCost(cost);
            scheduleVO.setStart(start);
            scheduleVO.setDay(day);
            scheduleVO.setTour(title);
            scheduleVO.setArCode(arCode);
            
            check = scheduleService.scheduleInsert(scheduleVO);
         
            if(check==true) {
               flag=1;
            }
         }
   
         
         mv.setViewName("schedulePage");
      
      

      return flag;
   }

   public void sc() throws Exception{
      
   }
   @GetMapping("schedulePage")
   public ModelAndView plannerPage(PlannerVO plannerVO, ScheduleVO scheduleVO, HttpSession session, int plNum, String scName)
         throws Exception {
      ModelAndView mv = new ModelAndView();

      
      MemberVO memberVO = (MemberVO) session.getAttribute("member");
      
      Integer totalCost=scheduleService.totalCost(plNum);
      
      if(totalCost!=null && totalCost>0 ) {
    	  
    	  mv.addObject("totalCost",totalCost);
      }
      
      List<PlannerVO> plannerList = plannerService.plannerSelectIndex(plNum);

      int totalBak=0;
      int mu = 0;
      
      List<Integer> bak = new ArrayList<Integer>();
      List<Date> everyDay = new ArrayList<Date>();
      List<String> region = new ArrayList<String>();
      List<Integer> arCode = new ArrayList<Integer>();
      
      
      
      for (int i = 0; i < plannerList.size(); i++) {
         if (plannerList.get(i).getBak() == 0) {
            mu = 1;
         }
         totalBak += plannerList.get(i).getBak();
         bak.add(totalBak);
      }
      
      long firstDay = plannerList.get(0).getDeDate().getTime();
      long oneDay = 1000*60*60*24;
      everyDay.add(new Date(firstDay));
      int everyCheck = 0;
      int bakNum = 0;
      
      for (int i = 0; i < totalBak; i++) {
         if (plannerList.get(everyCheck).getBak()==0) {
            everyDay.add(new Date(firstDay));
            everyCheck++;
            i=i-1;
         }else {            
            firstDay = firstDay + oneDay;
            everyDay.add(new Date(firstDay));
         }
      }

      List<DayArCodeVO> codeVO = new ArrayList<DayArCodeVO>();
      
      if (mu == 1) {         
         everyDay.add(plannerList.get(plannerList.size()-1).getArDate());
      }
      
      for (int i = 0; i < everyDay.size(); i++) {
            if (i < bak.get(bakNum)) {
               region.add(plannerList.get(bakNum).getRegion());
               arCode.add(plannerList.get(bakNum).getArCode());
            }else {
               arCode.add(plannerList.get(bakNum).getArCode());
               region.add(plannerList.get(bakNum).getRegion());
               
               bakNum++;
            }
            
      }
      

      int duNum=0;
      int duNum2 =0;
      for(int i =0; i< everyDay.size();i++) {
    	 
    	  DayArCodeVO aa = new DayArCodeVO();
    	  
    	  
    	  if (i < bak.get(duNum)) {
    		  aa.setDu(0);
    		  aa.setDu2(0);
    	  }else if(i==everyDay.size()-1) {
    		  aa.setDu(0);
    		  aa.setDu2(0);
    	  }
    	  else {
    		  aa.setDu(1);
    		  duNum++;
    		  duNum2+=aa.getDu();
    		  aa.setDu2(duNum2);
    	  }
    	  
    	  
    	  aa.setArCode(arCode.get(i));
    	  aa.setEveryDay(everyDay.get(i));
    	  
    	  codeVO.add(aa);
    	 
    	  System.out.println(i +"          :         "+codeVO.get(i).getArCode());
    	  System.out.println(i +"          :         "+codeVO.get(i).getDu());
    	  System.out.println(i +"          :         "+codeVO.get(i).getEveryDay());
      }
      
      mv.addObject("codeVO",codeVO);
      mv.addObject("mu", mu);
      mv.addObject("everyDay", everyDay);
      mv.addObject("city", region);
      mv.addObject("arCode", arCode);
      
      
      mv.addObject("bak", bak);
      
      List<ScheduleVO> scheduleList = scheduleService.scheduleList(plNum);
      List<WishVO> wishlist = wishService.myWish(session, plNum);
      
      boolean plannerLock = true;
      
      if (plannerList.get(0).getPlLock() == 1 && memberVO != null) {
		if (!plannerList.get(0).getId().equals(memberVO.getId())) {
			plannerLock = false;
		}
	}
      
      
      if(memberVO==null) {
         String msg="로그인이 필요합니다.";
         mv.addObject("message",msg);
         mv.addObject("path","../member/memberLogin?goBack=../schedule/schedulePage?plNum="+plNum);
         mv.setViewName("common/result");
         
      }else if(plannerList.size() !=0 && plannerLock) {
         
         
         List<ScheduleInfoVO> scheduleInfoVOs = new ArrayList<ScheduleInfoVO>();
         ScheduleInfoVO scheduleInfoVO =null;
         
         for(int i=0; i<scheduleList.size();i++) {
            
            String tour = scheduleList.get(i).getTour();
            System.out.println("tour    :    " +tour);
            
            String day = scheduleList.get(i).getDay();
            System.out.println("day    :    " +day);
            
            Map<String, Object> scInfo = scheduleService.scheduleInfo(tour, plNum);
            scheduleInfoVO = new ScheduleInfoVO();
            scheduleInfoVO.setTitle((String)scInfo.get("title"));
            scheduleInfoVO.setAddr1((String)scInfo.get("addr1"));
            scheduleInfoVO.setCost((Integer)scInfo.get("cost"));
            scheduleInfoVO.setFirstimage((String)scInfo.get("firstimage"));
            scheduleInfoVO.setStart((Integer)scInfo.get("start"));
            scheduleInfoVO.setDay((String)scInfo.get("day"));
            scheduleInfoVO.setTour((String)scInfo.get("tour"));
            scheduleInfoVO.setArCode((Integer)scInfo.get("arCode"));
            scheduleInfoVO.setScName((String)scInfo.get("scName"));
            System.out.println("sdfdsfsdfsfdfsdfdfs   :     "+scheduleInfoVO.getDay());
            scheduleInfoVOs.add(scheduleInfoVO);
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
         mv.setViewName("/schedule/schedulePage");
         
      }else {
         String msg="비공개 플래너는 볼 수 없습니다.";
         mv.addObject("message",msg);
         mv.addObject("path","/");
         mv.setViewName("common/result");
      }
      
      List<PlannerCommentVO> commentVOs=plannerService.getCommentList(plNum);
      mv.addObject("commentVOs", commentVOs);
      
      return mv;
   }


   

   @GetMapping("showList")
   public ModelAndView viewApi() throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/schedule/showList");
      return mv;
   }



	
	@GetMapping("reviewDelete")
	public ModelAndView reviewDelete(int cNum)throws Exception{
		ModelAndView mv=new ModelAndView();
		//plnum 찾기
		PlannerCommentVO commentVO=plannerService.findPlNum(cNum);
		int plNum=commentVO.getPlNum();
		boolean exist=plannerService.reviewDelete(cNum);		//must be false
		String msg="삭제 실패";
		String path="./schedulePage?plNum="+plNum;
		if(!exist) {
			msg="삭제 성공";
		}
		mv.setViewName("common/result");
		mv.addObject("message", msg);
		mv.addObject("path", path);
		return mv;
	}
	
	@PostMapping("reviewUpdate")
	public ModelAndView reviewUpdate(PlannerCommentVO plannerCommentVO) throws Exception{
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(plannerCommentVO.getCNum());
		System.out.println(plannerCommentVO.getId());
		System.out.println(plannerCommentVO.getPlNum());
		plannerService.pcomment(plannerCommentVO);
		ModelAndView mv =new ModelAndView();
		String path="./schedulePage?plNum="+plannerCommentVO.getPlNum();
		String message="수정 되었습니다.";
		mv.setViewName("common/result");
		mv.addObject("path", path);
		mv.addObject("message", message);
		return mv;
	}
	
	@GetMapping("reviewUpdate")
	public String reviewUpdate(int cNum,Model model)throws Exception{
		System.out.println("////////////////////////////////////////////////////////////////");
		System.out.println("cnum : "+cNum);
		PlannerCommentVO commentVO=plannerService.getComment(cNum);
		model.addAttribute("commentVO", commentVO);
		return "schedule/reviewUpdate";
	}
	
	@PostMapping("scheduleComment")
	public ModelAndView scheduleComment(@ModelAttribute("plannerCommentVO") PlannerCommentVO	 plannerCommentVO, int plNum, HttpSession session)throws Exception{
		ModelAndView mv=new ModelAndView();
		System.out.println("test : PlannerController : scheduleComment : plNum" +plNum);
		String path="../member/memberLogin";
		String message="로그인이 필요합니다.";
		if(session.getAttribute("member") != null) {
			System.out.println("plNum : "+plNum);
			System.out.println("plannerCommentVO.getTitle() : "+plannerCommentVO.getContents());
			boolean check=plannerService.pcomment(plannerCommentVO, plNum, session);
			path= "../schedule/schedulePage?plNum="+plNum;
			message="작성되었습니다.";
			mv.addObject("path", path);
			mv.addObject("message", message);
			mv.setViewName("common/result");
		}else {
			mv.setViewName("common/result");
			mv.addObject("path", path);
			mv.addObject("message", message);
		}
		
		return mv;
		
	}
	@GetMapping("scDelete")
	public void scDelete(Integer plNum, HttpSession session) throws Exception{
		MemberVO memberVO=(MemberVO) session.getAttribute("member");

		plannerService.plannerDel(memberVO.getId(), plNum);

	}
	
}

