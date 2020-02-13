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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.util.Pager;

@Controller
@RequestMapping("/funding/**")
public class FundingController {

	@Resource(name = "fundingService")
	private FundingService fundingService;

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
			@RequestParam int price, @RequestParam int goal, FundingVO fundingVO) throws Exception{
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
	//update
	@GetMapping("fundingUpdate")
	public ModelAndView fundingUpdate(@ModelAttribute FundingVO fundingVO, int num) throws Exception{
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
	@GetMapping("fundingJoinSelect")
	public ModelAndView fundingJoinSelect(String participationId) throws Exception{
		ModelAndView mv = new ModelAndView();
//		Optional<FundingVO> opt = fundingService.fundingJoinSelect(participationId);
//		Map<String, Object> ar = fundingService.fundingJoinSelect(participationId);
//		FundingVO fundingVO = ar.get();
//		List<FundingVO> ar = fundingService.fundingJoinSelect(participationId);
//		FundingVO fundingVO = ar.get(0);
		
		List<FundingJoinVO> ar = fundingService.fundingJoinSelect(participationId);
		List<FundingVO> ar2= new ArrayList<FundingVO>();
//		System.out.println(ar.size());
		for (FundingJoinVO fundingJoinVO : ar) {
			ar2.add(fundingJoinVO.getFundingVO());
		}
		mv.addObject("vo2", ar2);
		mv.addObject("vo", ar);
		mv.setViewName("funding/fundingJoinSelect");
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
		int gage = (status*100/goal);
//		System.out.println(gage+"gage/controller");
		//DB에 저장되어 있던 status
		int status2 = fundingVO.getStatus();
//		System.out.println(status2+"status2/controller");
		//DB에 저장되어 있던 gage
		int gage2 = fundingVO.getGage();
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

}
