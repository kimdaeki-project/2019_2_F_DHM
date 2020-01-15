package com.f.dhm.Member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {


	//-----------------------------------------------------------------------
	
	
	@GetMapping("memberJoin")
	public String memberJoin()throws Exception{
		System.out.println("ㅎㅇ");
		return "member/memberJoin";
	}
	
	
	//-----------------------------------------------------------------------
	
	
	@GetMapping("memberLogin")
	public String memberLogin()throws Exception{
		
		return "member/memberLogin";
	}
	
	
	//-----------------------------------------------------------------------
	
	
	@GetMapping("memberFacebookLogin")
	public String memberFacebookLogin()throws Exception{
		
		return "member/memberFacebookLogin";
	}
	
	
	
	
	
	
	
	//-----------------------------------------------------------------------
	
	//-----------------------------------------------------------------------
	
	//-----------------------------------------------------------------------
	
	//-----------------------------------------------------------------------
	
	//-----------------------------------------------------------------------
	@GetMapping("memberPrivacyPolicy")
	public String memberPrivacyPolicy()throws Exception{
		
		return "member/memberUsePage/memberPrivacyPolicy";
	}
	
	@GetMapping("memberTermsAndConditions")
	public String memberTermsAndConditions()throws Exception{
		
		return "member/memberUsePage/memberTermsAndConditions";
	}
	//-----------------------------------------------------------------------
}
