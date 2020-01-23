package com.f.dhm.funding;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
			FundingVO fundingVO) throws Exception{
		//날짜+시간 합쳐서 집어넣기
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		//날짜 차이 구해서 집어넣기
//		System.out.println(start);
//		System.out.println(end);
		SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date start2 = transFormat2.parse(start);
		Date end2 = transFormat2.parse(end);
//		System.out.println(start2);
//		System.out.println(end2);
		long restTime  = (end2.getTime() - start2.getTime()) / (60*60*24*1000);
//		System.out.println(restTime+"일");
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
		fundingVO.setRestTime((int)restTime+1);
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
			@RequestParam String end, @RequestParam String time2
			) throws Exception{
		//		fundingService.fundingUpdate(fName, contents, goal, startTime, endTime, people, fundingVO.getFNum());
		//날짜+시간 합쳐서 집어넣기
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		//날짜 차이 구해서 집어넣기
		SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date start2 = transFormat2.parse(start);
		System.out.println(start2);
		Date end2 = Calendar.getInstance().getTime();
		
//		System.out.println(start2);
//		System.out.println(end2);
		long restTime  = (start2.getTime() - end2.getTime()) / (60*60*24*1000);
		System.out.println(restTime);
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
		fundingVO.setRestTime((int)restTime+1);
		fundingService.fundingUpdate(fundingVO);

		return "redirect:./fundingList";
	}
	//delete
	@GetMapping("fundingDelete")
	public String fundingDelete(int num) throws Exception{
		//		ModelAndView mv = new ModelAndView();
		fundingService.fundingDelete(num);

		return "redirect:./fundingList";
	}

	//fundingJoin//
	@GetMapping("fundingJoinList")
	public ModelAndView fundingJoinList(FundingVO fundingVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		//		List<FundingVO> list = fundingService.fundingJoinList(num);
		fundingVO = fundingService.fundingJoinList(fundingVO);
		
		mv.addObject("vo", fundingVO);
		//		mv.addObject("list", list);
		mv.setViewName("funding/fundingJoinList");
		System.out.println("123");
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
									@RequestParam int participationPeople, FundingJoinVO fundingJoinVO, FundingVO fundingVO, int fNum) throws Exception{
//		System.out.println(fNum+"fNum임");
		
		
//		System.out.println(price+"price");
//		System.out.println(goal+"goal");
//		System.out.println(participationPeople+"people");
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
		fundingJoinVO.setFundingVO(fundingVO);
		fundingService.fundingJoinWrite(fundingJoinVO);
		return "redirect:./fundingList";
	}
	
	@GetMapping("fundingJoinDelete")
	public String fundingJoinDelete(int num) throws Exception{
			fundingService.fundingJoinDelete(num);
		return "redirect:./fundingList";
	}

}
