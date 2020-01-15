package com.f.dhm.funding;

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
	public ModelAndView fundingSelect(Integer fNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		Optional<FundingVO> opt = fundingService.fundingSelect(fNum);
		
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
		mv.setViewName("funding/fundingWrite");
		
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
	public String fundingWrite(FundingVO fundingVO) throws Exception{
		fundingService.fundingWrite(fundingVO);
		
		return "redirect:./fundingList";
	}
	//update
	@GetMapping("fundingUpdate")
	public ModelAndView fundingUpdate(Integer fNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		fundingService.fundingSelect(fNum);
		return mv;
	}
	@PostMapping
	public String fundingUpdate(FundingVO fundingVO
//			, @RequestParam String fName, @RequestParam String contents,
//			@RequestParam int goal, @RequestParam Date startTime,
//			@RequestParam Date endTime, @RequestParam int people
			) throws Exception{
//		fundingService.fundingUpdate(fName, contents, goal, startTime, endTime, people, fundingVO.getFNum());
		fundingService.fundingUpdate(fundingVO);
		
		return "redirect:./fundingList";
	}
	//delete
	@GetMapping("fundingDelete")
	public String fundingDelete(Integer fNum) throws Exception{
//		ModelAndView mv = new ModelAndView();
		fundingService.fundingDelete(fNum);
		
		return "redirect:./fundingList";
	}
	
}
