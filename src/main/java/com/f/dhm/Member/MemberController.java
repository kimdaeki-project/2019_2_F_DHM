package com.f.dhm.Member;

import java.util.Enumeration;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.f.dhm.Member.MemberVO;
import com.f.dhm.commonnotice.CommonService;
import com.f.dhm.commonnotice.CommonVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CommonService CommonService;

	//회원가입-----------------------------------------------------------------------
	@GetMapping("memberJoin")
	public String memberJoin()throws Exception{
	
		return "member/memberJoin";
	}
	
	
	@PostMapping("memberJoin")
	public ModelAndView memberJoin( MemberVO memberVO, BindingResult bindingResult, HttpServletRequest httpServletRequest)throws Exception{
		
	System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	
	Enumeration<String> at = httpServletRequest.getParameterNames();
	while(at.hasMoreElements()) {
		System.out.println(at.nextElement());
	}
	
	System.out.println(httpServletRequest.getParameter("birth"));
	System.out.println("memberVO.getBirth() : "+memberVO.getBirth());
		ModelAndView mv = new ModelAndView();
										
		if(memberService.memberJoinValidate(memberVO, bindingResult)) {

			mv.setViewName("member/memberJoin");

		}else {

			memberService.memberJoin(memberVO);		

			String path = "../";

			String message = "DHM 회원이 되신 것을 축하드립니다.";

			mv.setViewName("common/result");
			mv.addObject("message", message);											
			mv.addObject("path", path);
		}
									
		return mv;
	}
	//로그인-----------------------------------------------------------------------
	@GetMapping("memberLogin")
	public ModelAndView memberLogin(@Nullable String goBack)throws Exception{
		ModelAndView mv = new ModelAndView();
		if (goBack != null) {
			mv.addObject("goBack", goBack );
		}
		
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, String goBack,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.memberLogin(memberVO);
		String message = "로그인 실패.";
		String path = "/";
		
		if(memberVO != null) {
			message = "DHM에 오신 것을 환영합니다.";
			if (goBack != "") {
				path = goBack;
			}else {				
				path = "/";
			}
			session.setAttribute("member", memberVO);
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}	
	//페이스북 로그인-----------------------------------------------------------------------
	@GetMapping("memberFacebookLogin")
	public String memberFacebookLogin()throws Exception{
		
		return "member/memberFacebookLogin";
	}
	//로그아웃-----------------------------------------------------------------------
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		
		session.invalidate();
		
		return "redirect:../";
	}	
	//PW 불러오기-----------------------------------------------------------------------
//	@PostMapping("memberEMAIL3Check")
//	@ResponseBody
//	public String memberEMAIL3Check(String id)throws Exception{		
//		
//		if(memberService.memberEMAIL3Check(id) == null) {
//			return "[error] 다시 입력하십시오.";
//		}else {			
//			return "PW : "+memberService.memberEMAIL3Check(id).getPw();
//		}		
//	}	
	
	//2개
	int number = 0;
	
	@PostMapping("memberEMAIL3Check")
	@ResponseBody
	public String memberEMAIL3Check(String id, String email)throws Exception{		
		
		System.out.println("@@@@@@@@@@@ Controller Check? : "+ memberService.memberEMAIL3Check(id, email));
		number++;
		System.out.println(number);	
		
		 MemberVO member = memberService.memberEMAIL3Check(id, email);
		if(member == null) {
			//null일때
			return "[error] 아이디 찾기 후 다시 입력하십시오.";
		}else {			
			return "PW : "+member.getPw();
		}	
	}	
	//ID 불러오기-----------------------------------------------------------------------
	@PostMapping("memberEMAIL2Check")
	@ResponseBody
	public String memberEMAIL2Check(String email)throws Exception{		
		
		if(memberService.memberEMAIL2Check(email) == null) {
			return "[error] 다시 입력하십시오.";
		}else {			
			return "ID : "+memberService.memberEMAIL2Check(email).getId();
		}		
	}	
	//ID 체크-----------------------------------------------------------------------
//	@PostMapping("memberIdCheck")
//	@ResponseBody
//	public boolean memberIdCheck(String id)throws Exception{
//		return memberService.memberIdCheck(id);
//	}
	
	@PostMapping("memberIdCheck")
	public boolean memberIdCheck(String id)throws Exception{
		boolean check= memberService.memberIdCheck(id);
		System.out.println("있냐" +check);
		return true;
	}
	//PW 체크-----------------------------------------------------------------------
	@PostMapping("memberPWCheck")
	@ResponseBody
	public boolean memberPWCheck(String Pw)throws Exception{
		return memberService.memberPWCheck(Pw);
	}
	//EMAIL 체크-----------------------------------------------------------------------
	@PostMapping("memberEMAILCheck")
	@ResponseBody
	public MemberVO memberEMAILCheck(String email)throws Exception{		
		
		return memberService.memberEMAILCheck(email);
	}	
	//-----------------------------------------------------------------------
	@ModelAttribute("memberVO")
	public MemberVO memberVO()throws Exception{
		return new MemberVO();
	}
	//마이 페이지 프로필 변경-----------------------------------------------------------------------
	@GetMapping("memberMypage")
	public String memberMypage()throws Exception{
		
		return "member/memberMypage";
	}
	
	@PostMapping("memberMypage")
	public ModelAndView memberMypage(@Valid MemberVO memberVO, BindingResult bindingResult, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberMypage");
		
		memberService.memberMypage(memberVO);
			
		//session.invalidate();
		session.setAttribute("member",memberVO);
		
		String path = "./memberMypage";

		String message = "프로필 변경 되었습니다.";

		mv.setViewName("common/result");
		mv.addObject("message", message);											
		mv.addObject("path", path);
									
	return mv;
}
	//마이페이지 프로필 사진 변경-----------------------------------------------------------------------
	@GetMapping("memberMypageImg")
	public String memberMypageImg(HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		model.addAttribute("memberVO", memberVO);	

		return "member/memberMypage";
	}
	
	@PostMapping("memberMypageImg")
	public ModelAndView memberMypageImg(@Valid MemberVO memberVO, BindingResult bindingResult, HttpSession session, MultipartFile files)throws Exception{
	
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("member/memberMypage");
		String message = "프로필 사진 변경 실패";
		System.out.println();
		if (memberService.memberMypageImg(session, files)) {			
			memberVO = memberService.memberLogin(memberVO);
			message = "프로필 사진 변경 완료";			
		}		
		session.setAttribute("member", memberVO);	
		String path = "./memberMypage";	
		
		mv.setViewName("common/result");
		mv.addObject("message", message);
		mv.addObject("path", path);		
		
		return mv;	
	}
	//개인정보 및 이용약관 페이지-----------------------------------------------------------------------
	@GetMapping("memberUsePage/memberCommonNotice")
	public ModelAndView memberCommonNotice()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberUsePage/memberCommonNotice");
				
		return mv;
	}

	@PostMapping("memberUsePage/memberCommonNotice")
	public ModelAndView commonNotice(CommonVO commonVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberService.commonNotice(commonVO);
		String message = "접수 실패.";
		if(memberService.commonNoticeCheck(commonVO)) {
			
			 message = "접수 성공.";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", "member/memberUsePage/memberCommonNotice");
		mv.setViewName("common/result");
		
		return mv;
	}
	

	
	
	@GetMapping("memberPrivacyPolicy")
	public String memberPrivacyPolicy()throws Exception{
		
		return "member/memberUsePage/memberPrivacyPolicy";
	}
	
	@GetMapping("memberTermsAndConditions")
	public String memberTermsAndConditions()throws Exception{
		
		return "member/memberUsePage/memberTermsAndConditions";
	}
	
	@GetMapping("memberTravelReservation")
	public String memberTravelReservation()throws Exception{
		
		return "member/memberUsePage/memberTravelReservation";
	}
	
	@GetMapping("memberGuideTermsandConditions")
	public String memberGuideTermsandConditions()throws Exception{
		
		return "member/memberUsePage/memberGuideTermsandConditions";
	}
	//ID PW 찾기-----------------------------------------------------------------------
	@GetMapping("memberCheckIDandPW")
	public String memberCheckIDandPW()throws Exception{
		
		return "member/memberUsePage/memberCheckIDandPW";
	}
	//-----------------------------------------------------------------------
	@PostMapping("myPlanner")
	public String gomakePlanner()throws Exception{
		
		return "planner/myPlanner";
	}
	//회원 정보 업데이트-----------------------------------------------------------------------
	@GetMapping("memberUpdate")
	public String memberUpdatePage()throws Exception{
		
		return "member/memberUpdate";
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdatePage(@Valid MemberVO memberVO, BindingResult bindingResult, HttpSession session, MemberFilesVO memberFilesVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberUpdate");
		
		memberService.memberUpdatePage(memberVO);
			
		//session.invalidate();
		session.setAttribute("member",memberVO);
		
		String path = "./memberUpdate";

		String message = "프로필 변경 되었습니다.";

		mv.setViewName("common/result");
		mv.addObject("message", message);											
		mv.addObject("path", path);
		
		return mv;
	}	
	//회원 탈퇴-----------------------------------------------------------------------
	@GetMapping("memberGetout")
	public String memberGetout()throws Exception{
		
		return "member/memberGetout";
	}
	
	@PostMapping("memberGetout")
	public ModelAndView memberGetout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO mbm=(MemberVO)session.getAttribute("member");
		boolean check = memberService.memberGetout(mbm);
		System.out.println("@@@@@@@ id: ");
		
		String msg = "[system] 회원 탈퇴 실패";
		String path="member/memberGetout";
		
		if(check) {
			mv.addObject("message", msg);
			mv.addObject("path", path);
			mv.setViewName("common/result");
			
		}else {
			msg = "[system] 회원 탈퇴 성공";
			path="../";
			mv.addObject("message", msg);
			mv.addObject("path", path);
			
			mv.setViewName("common/result");
			session.invalidate();
		}
		
		
		return mv;
	}
	
}
