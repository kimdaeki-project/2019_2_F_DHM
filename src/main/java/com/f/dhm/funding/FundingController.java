package com.f.dhm.funding;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.annotation.Resource;

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
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
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
	@PostMapping
	public String fundingUpdate(FundingVO fundingVO,
			@RequestParam String start, @RequestParam String time1,
			@RequestParam String end, @RequestParam String time2
			) throws Exception{
//		fundingService.fundingUpdate(fName, contents, goal, startTime, endTime, people, fundingVO.getFNum());
		String startTime = start +" "+ time1;
		String endTime = end +" "+ time2;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startTime2 = transFormat.parse(startTime);
		Date endTime2 = transFormat.parse(endTime);
		fundingVO.setStartTime(startTime2);
		fundingVO.setEndTime(endTime2);
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
	
}
