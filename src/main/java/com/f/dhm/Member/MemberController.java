package com.f.dhm.Member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;

	//-----------------------------------------------------------------------
	@GetMapping("memberJoin")
	public String memberJoin()throws Exception{
	
		return "member/memberJoin";
	}
	
	@PostMapping("memberJoin")
	public ModelAndView memberJoin(MemberVO memberVO, BindingResult bindingResult)throws Exception{
			System.out.println("memberVO.getBirth() : "+memberVO.getBirth());
			System.out.println("memberVO.getGender() : " + memberVO.getGender());
			System.out.println("memberVO.getName() : " + memberVO.getName());
			System.out.println("memberVO.getPassword() : " + memberVO.getPw());
			System.out.println("memberVO.getPassword2() : " + memberVO.getPw2());
			System.out.println("memberVO.getEmail() : " + memberVO.getEmail());
			
		ModelAndView mv = new ModelAndView();
										
		if(memberService.memberJoinValidate(memberVO, bindingResult)) {

			mv.setViewName("member/memberJoin");

		}else {
								System.out.println("3");		
			memberService.memberJoin(memberVO);		
								System.out.println("4");
			String path = "../";
								System.out.println("5");
			String message = "DHM 회원이 되신 것을 축하드립니다.";
								System.out.println("6");
			mv.setViewName("common/result");
			mv.addObject("message", message);											
			mv.addObject("path", path);
		}
									
		return mv;
	}
	
	//-----------------------------------------------------------------------
	
	
	@GetMapping("memberLogin")
	public String memberLogin()throws Exception{
		
		return "member/memberLogin";
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.memberLogin(memberVO);
		String message = "로그인 실패.";
		String path = "/";
		
		if(memberVO != null) {
			message = "DHM에 오신 것을 환영합니다.";
			path = "/";
			session.setAttribute("member", memberVO);
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//-----------------------------------------------------------------------
	
	
	@GetMapping("memberFacebookLogin")
	public String memberFacebookLogin()throws Exception{
		
		return "member/memberFacebookLogin";
	}
	
	
	
	
	
	
	
	//-----------------------------------------------------------------------
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	//-----------------------------------------------------------------------
	@PostMapping("memberIdCheck")
	@ResponseBody
	public boolean memberIdCheck(String id)throws Exception{
		return memberService.memberIdCheck(id);
	}
	
	@ModelAttribute("memberVO")
	public MemberVO memberVO()throws Exception{
		return new MemberVO();
	}
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
