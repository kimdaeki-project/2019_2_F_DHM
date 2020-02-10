package com.f.dhm.hc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberService;
import com.f.dhm.funding.FundingService;
import com.f.dhm.location.LocationService;

@Controller
public class HomeController {
	
	@Autowired
	private LocationService LoService; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FundingService fuService;

	@GetMapping("/")
	public String index() throws Exception{
		return "index";
	}
	
	@GetMapping("/template/basic")
	public String basic() {
		return "template/basic";
	}
	
	@GetMapping("/gnb/serviceCenter")
	public String serviceCenter() {
		return "gnb/serviceCenter";
	}
	
	
	@GetMapping("/admin/administer")
	public ModelAndView viewAdmin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("Lolist", LoService.selectList());
		mv.addObject("memList", memberService.allMember());
		mv.addObject("fuList", fuService.allList());
		
		return mv;
	}
}
	
