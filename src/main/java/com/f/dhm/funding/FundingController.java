package com.f.dhm.funding;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberVO;
import com.f.dhm.location.LocationService;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;
import com.f.dhm.schedule.ScheduleInfoVO;
import com.f.dhm.schedule.ScheduleService;
import com.f.dhm.schedule.ScheduleVO;
import com.f.dhm.schedule.test.Items;
import com.f.dhm.schedule.test.XmlService;
import com.f.dhm.util.Pager;
import com.f.dhm.wishlist.WishService;
import com.f.dhm.wishlist.WishVO;

@Controller
@RequestMapping("/funding/**")
public class FundingController {

	@Resource(name = "fundingService")
	private FundingService fundingService;

	@Resource(name = "plannerService")
	private PlannerService plannerService;

	@Resource(name = "locationService")
	private LocationService locationService;

	@Resource(name = "wishService")
	private WishService wishService;
	
	@Resource(name = "scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name = "xmlService")
	private XmlService xmlService;
	
	//select
	@GetMapping("fundingSelect")
	public ModelAndView fundingSelect(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		Optional<FundingVO> opt = fundingService.fundingSelect(num);

		if(opt.isPresent()) {
			mv.setViewName("funding/fundingSelect");
			mv.addObject("vo", opt.get());
		}else {
			mv.setViewName("common/result");
			mv.addObject("message", "No Contents");
			mv.addObject("path", "./fundingList");
		}

		return mv;
	}
	//list
	@GetMapping("fundingList")
	public ModelAndView fundingList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		pager = fundingService.fundingList(pager);

		mv.addObject("list", pager);
		mv.setViewName("funding/fundingList");

		return mv;
	}

	@GetMapping("makeFundingList")
	public ModelAndView makeFundingList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		List<FundingVO> list = fundingService.makeFundingList(vo.getId());

		String s_id = (String)session.getAttribute("id");
		if (vo.getId().equals(s_id)) {
			mv.addObject("vo", list);
			mv.setViewName("funding/makeFundingList");
		} else {
			mv.setViewName("index");
		}
		return mv;
	}

	//write
	@GetMapping("fundingWrite")
	public ModelAndView fundingWrite() throws Exception{
		ModelAndView mv = new ModelAndView();

		mv.addObject("fundingVO", new FundingVO());
		mv.setViewName("funding/fundingWrite");

		return mv;
	}
	@PostMapping("fundingWrite")
	public String fundingWrite(@RequestParam String start, @RequestParam String time1,
			@RequestParam String end, @RequestParam String time2,
			@RequestParam int price, @RequestParam int goal, FundingVO fundingVO, PlannerVO plannerVO) throws Exception{
		//날짜+시간 합쳐서 집어넣기
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		//날짜 차이 구해서 집어넣기
		SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date start2 = transFormat2.parse(start);
		Date end2 = transFormat2.parse(end);
		long restTime  = (end2.getTime() - start2.getTime()) / (60*60*24*1000);
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
		fundingVO.setRestTime((int)restTime+1);
		//목표 금액과 금액을 이용해 제한 인원 구하기
		int people = goal/price;
		fundingVO.setPeople(people);

		fundingService.fundingWrite(fundingVO);

		return "redirect:./fundingList";
	}

	//fundingPlanner
	@GetMapping("fundingPlanner")
	public ModelAndView makeFunding() throws Exception{
		ModelAndView mv = new ModelAndView();

		mv.addObject("purpose", 9);
		return mv;
	}

	@PostMapping("fundingPlanner")
	@ResponseBody
	public int fundingPlanner(FundingVO fundingVO, @RequestParam String contents, String start, String time1, String end, String time2,
			int price, int goal, String id, String title, String type, String people, String[] deDate, String[] arDate,
			String[] bak, String[] region, String[] transfer, String[] titleA, String[] firstimage, 
			String[] addr1, int[] arCode,HttpSession session, int[] pp, int[] arCodeP, Integer plNum, String email
			) throws Exception{
		System.out.println("123456");
		//planner Table
		List<PlannerVO> pList = new ArrayList<PlannerVO>();


		if (plNum != null) {         
			plannerService.plannerDel(id, plNum);
		}
		

		plNum = plannerService.getPlnum();

		System.out.println("plNum = " + deDate.length);

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

			int tLength = 0; 
	         if (transfer != null) {
	        	 tLength = transfer.length;
			}
	         //도시 정보 추가           
	         if (i > 0 && deDate.length > 1 && tLength > 0) {          
				vo.setTransfer(transfer[i-1]);
				locationService.updateLoc(arCodeP[i], Integer.parseInt(bak[i]), transfer[i-1]);
			}else {
				locationService.updateLoc(arCodeP[i], Integer.parseInt(bak[i]), "선택"); 
			}
			//도시정보추가

			vo.setPolyPath(pp[i]);
			vo.setArCode(arCodeP[i]);


			pList.add(vo);
		}

		for (PlannerVO plannerVO : pList) {
			System.out.println(plannerVO);
		}
		plannerService.saveList(pList);

		//////////////////////////////////////////

		//MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<WishVO> wishlist = new ArrayList<WishVO>();

		//id= memberVO.getId();
		if(titleA!=null) { 
		for(int i=0; i< titleA.length; i++) {
			WishVO wishVO = new WishVO();
			wishVO.setId(id);
			wishVO.setTitle(titleA[i]);
			wishVO.setFirstimage(firstimage[i]);
			wishVO.setAddr1(addr1[i]);
			wishVO.setPlNum(plNum);
			wishVO.setArCode(arCode[i]);
			System.out.println(i+"   +    "+wishVO.getTitle());
			wishlist.add(wishVO);

		}
		
		wishService.wishAdd(wishlist, plNum, title);
		}
		//funding Table
		//날짜+시간 합쳐서 집어넣기
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		//날짜 차이 구해서 집어넣기
		SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date start2 = transFormat2.parse(start);
		Date end2 = transFormat2.parse(end);
		long restTime  = (end2.getTime() - start2.getTime()) / (60*60*24*1000);
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
		fundingVO.setRestTime((int)restTime+1);
		//목표 금액과 금액을 이용해 제한 인원 구하기
		int people2 = goal/price;
		fundingVO.setPeople(people2);
		fundingVO.setName(title);
		fundingVO.setPlNum(plannerService.getPlnum()-1);
		fundingVO.setContents(contents);

		fundingService.fundingWrite(fundingVO);

		return pList.get(0).getPlNum();
	}

	//update
	@GetMapping("fundingUpdate")
	public ModelAndView fundingUpdate(@ModelAttribute FundingVO fundingVO, int num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		Optional<FundingVO> opt = fundingService.fundingSelect(num);

		if(opt.isPresent()) {
			mv.setViewName("funding/fundingUpdate");
			mv.addObject("vo", opt.get());
		}else {
			mv.setViewName("common/result");
			mv.addObject("message", "No Contents");
			mv.addObject("path", "./fundingList");
		}
		return mv;
	}
	@PostMapping("fundingUpdate")
	public String fundingUpdate(FundingVO fundingVO,
			@RequestParam String start, @RequestParam String time1,
			@RequestParam String end, @RequestParam String time2,
			@RequestParam int price, @RequestParam int goal,
			@RequestParam String rDate
			) throws Exception{
		//날짜+시간 합쳐서 집어넣기
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		//날짜 차이 구해서 집어넣기
		SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date start2 = transFormat2.parse(start);
		Date end2 = Calendar.getInstance().getTime();
		long restTime  = (start2.getTime() - end2.getTime()) / (60*60*24*1000);
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
		fundingVO.setRestTime((int)restTime+1);
		//목표 금액과 금액을 이용해 제한 인원 구하기
		int people = goal/price;
		fundingVO.setPeople(people);
		fundingVO.setParticipationPeople(fundingVO.getParticipationPeople());
		//펀딩 작성 시간 넣기
		Date rDate2 = transFormat.parse(rDate);
		fundingVO.setRegDate(rDate2);

		fundingService.fundingUpdate(fundingVO);

		return "redirect:./fundingList";
	}
	//delete
	@GetMapping("fundingDelete")
	public String fundingDelete(int num) throws Exception{
		fundingService.fundingDelete(num);

		return "redirect:./fundingList";
	}
	//fundingJoin//
	//펀딩한 사람이 보는 참여자 리스트
	@GetMapping("fundingJoinList")
	public ModelAndView fundingJoinList(int fNum, FundingVO fundingVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		//		List<FundingVO> list = fundingService.fundingJoinList(num);
		//		fundingVO.setNum(fundingVO.getNum());
		Optional<FundingVO> ar = fundingService.fundingJoinList(fNum);
		fundingVO = ar.get();
		mv.addObject("vo", fundingVO);
		mv.setViewName("funding/fundingJoinList");

		return mv;
	}
	//펀딩 참여한 사람이 보는 펀딩 참여 리스트
	@GetMapping("myFundingList")
	public ModelAndView fundingJoinSelect(String participationId, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		participationId = vo.getId();
		List<FundingJoinVO> ar = fundingService.myFundingList(participationId);
		List<FundingVO> ar2= new ArrayList<FundingVO>();
		//		System.out.println(ar.size());
		for (FundingJoinVO fundingJoinVO : ar) {
			ar2.add(fundingJoinVO.getFundingVO());
		}

		String s_id = (String)session.getAttribute("id");
		if (participationId.equals(s_id)) {
			mv.addObject("vo2", ar2);
			mv.addObject("vo", ar);
			mv.setViewName("funding/myFundingList");			
		} else {
			mv.setViewName("index");
		}
		return mv;

	}


	//	@GetMapping("fundingJoinUpdate")
	//	public ModelAndView fundingJoinUpdate(@ModelAttribute FundingJoinVO fundingJoinVO, String id) throws Exception{
	//		ModelAndView mv = new ModelAndView();
	//		//		Optional<FundingJoinVO> opt = fundingJoinSelect(id);
	//		//		
	//		//		if(opt.isPresent()) {
	//		//			mv.setViewName("funding/fundingUpdate");
	//		//			mv.addObject("vo", opt.get());
	//		//		}else {
	//		//			mv.setViewName("common/result");
	//		//			mv.addObject("message", "No Contents");
	//		//			mv.addObject("path", "./fundingList");
	//		//		}
	//		return mv;
	//	}
	//	@PostMapping("fundingJoinUpdate")
	//	public String fundingJoinUpdate(FundingJoinVO fundingJoinVO) throws Exception{
	//		//		fundingService.fundingJoinUpdate(fundingJoinVO);
	//		return "redirect:./fundingList";
	//	}
	//joinWrite
	@GetMapping("fundingJoinWrite")
	public ModelAndView fundingJoinWrite(@ModelAttribute FundingVO fundingVO, int num) throws Exception{
		ModelAndView mv = new ModelAndView();

		Optional<FundingVO> opt = fundingService.fundingSelect(num);

		if(opt.isPresent()) {
			mv.setViewName("funding/fundingJoinWrite");
			mv.addObject("vo", opt.get());
		}else {
			mv.setViewName("common/result");
			mv.addObject("message", "No Contents");
			mv.addObject("path", "./fundingList");
		}
		return mv;
	}

	@PostMapping("fundingJoinWrite")
	public String fundingJoinWrite(@RequestParam int price, @RequestParam int goal,
			@RequestParam int participationPeople,
			@RequestParam int pp, FundingJoinVO fundingJoinVO,
			FundingVO fundingVO, int fNum) throws Exception{
		//DB에 넣을 status
		int status = price*participationPeople;
		//		System.out.println(status+"status/controller");
		//DB에 넣을 gage
		double gage = (status*100/goal);
		//		System.out.println(gage+"gage/controller");
		//DB에 저장되어 있던 status
		int status2 = fundingVO.getStatus();
		//		System.out.println(status2+"status2/controller");
		//DB에 저장되어 있던 gage
		double gage2 = fundingVO.getGage();
		//		System.out.println(gage2+"gage2/controller");
		fundingVO.setStatus(status2+status);
		fundingVO.setGage(gage2+gage);
		fundingVO.setNum(fNum);

		System.out.println(pp+": DB에 있는 참여 인원");
		System.out.println(participationPeople);

		fundingVO.setParticipationPeople(pp+participationPeople);
		//펀딩에 참여할 총 금액
		BigInteger total = BigInteger.valueOf(price * participationPeople);
		fundingJoinVO.setTotal(total);
		fundingJoinVO.setFundingVO(fundingVO);
		fundingService.fundingJoinWrite(fundingJoinVO);
		return "redirect:./fundingList";
	}

	@GetMapping("fundingJoinDelete")
	public String fundingJoinDelete(int num) throws Exception{
		fundingService.fundingJoinDelete(num);
		//			FundingVO fundingVO = new FundingVO();
		//			fundingVO.setNum(fundingVO.getNum());
		//			fundingVO.setStatus(fundingVO.getStatus()-(price * participationPeople));
		//			int goal = fundingVO.getGoal().intValue();
		//			fundingVO.setGage(fundingVO.getGage() - (price * participationPeople*100/goal));
		//			fundingService.fundingUpdate(fundingVO);
		return "redirect:./fundingList";
	}
	

	@GetMapping("myFundingSelect")
	public ModelAndView plannerPage(@RequestParam int num, PlannerVO plannerVO, ScheduleVO scheduleVO, HttpSession session, String scName)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Optional<FundingVO> fundingVO = fundingService.fundingSelect(num);

		int plNum = fundingVO.get().getPlNum();
//		System.out.println(plNum);
	
		
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		

		List<PlannerVO> plannerList = plannerService.plannerSelect(plNum, session);

		int bak=0;
		
		for (int i = 0; i < plannerList.size(); i++) {
			
			bak = plannerList.get(i).getBak();
			mv.addObject("bak", bak);
			
		}
		
		
		List<ScheduleVO> scheduleList = scheduleService.scheduleList(plNum);
		List<WishVO> wishlist = wishService.myWish(session, plNum);
		
		
		if(memberVO==null) {
			String msg="로그인이 필요합니다.";
			mv.addObject("message",msg);
			mv.addObject("path","../member/memberLogin");
			mv.setViewName("common/result");
			
		}else if(plannerList.get(0).getId().equals(memberVO.getId())) {
			
				
				mv.addObject("fund", fundingVO.get());
			
			
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
			mv.setViewName("/funding/myFundingSelect");
			
		}else if(plannerList.size()==0){
			String msg="다른사람의 플래너는 열람할 수 없습니다.";
			mv.addObject("message",msg);
			mv.addObject("path","../");
			mv.setViewName("common/result");
		}
		

		return mv;
	}
	
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
	
	@GetMapping("showList")
	public ModelAndView viewApi() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/schedule/showList");
		return mv;
	}
}
